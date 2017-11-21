import Foundation

fileprivate enum VolkswagenError: Error {
    case invalidResponse, invalidBundleInfo
}

public class Volkswagen {

    public static let defaultInstance = Volkswagen()

    private let bundleId: String? = {
        return Bundle.main.bundleIdentifier
    }()
    private let appVersion: String? = {
        return Bundle.main.releaseVersionNumber
    }()
    public var isAppInReview: Bool = true

    private init() {}

    public func check(completion: @escaping (Bool) -> Void) {
        guard let bundleId = bundleId,
            let appVersion = appVersion else {
                // something went wrong
                // for safety, when something goes wrong, we assume we are in review
                isAppInReview = true
                DispatchQueue.main.async { completion(self.isAppInReview) }
                return
        }
        appstoreVersion(forBundleId: bundleId) { (version) in
            guard let storeVersion = version else {
                self.isAppInReview = true
                DispatchQueue.main.async { completion(self.isAppInReview) }
                return
            }
            switch storeVersion.compare(appVersion, options: .numeric) {
            case .orderedAscending:
                self.isAppInReview = true
            case .orderedDescending, .orderedSame:
                self.isAppInReview = false
            }
            DispatchQueue.main.async { completion(self.isAppInReview) }
        }
    }
}

fileprivate extension Volkswagen {
    func appstoreVersion(forBundleId bundleId: String, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/lookup?bundleId=\(bundleId)") else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let error = error { throw error }
                guard let data = data else {
                    throw VolkswagenError.invalidResponse
                }
                let json = try JSONSerialization.jsonObject(
                    with: data,
                    options: [.allowFragments]
                    ) as? [String: Any]
                guard let result = (json?["results"] as? [Any])?.first as? [String: Any],
                    let version = result["version"] as? String else {
                        throw VolkswagenError.invalidResponse
                }
                completion(version)
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}

fileprivate extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
