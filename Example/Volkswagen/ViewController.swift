//
//  ViewController.swift
//  Volkswagen
//
//  Created by rahuljiresal on 11/20/2017.
//  Copyright (c) 2017 rahuljiresal. All rights reserved.
//

import UIKit
import Volkswagen

class ViewController: UIViewController {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkButtonPressed(_ sender: Any) {
        Volkswagen.defaultInstance.check { (isAppInReview) in
            self.resultLabel.text = "App is\(!isAppInReview ? " not" : "") in review"
        }
    }
}

