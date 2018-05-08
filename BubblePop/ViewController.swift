//
//  ViewController.swift
//  BubblePop
//
//  Created by Abdol Vatandoust on 26/4/18.
//  Copyright © 2018 Abdol Vatandoust. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var timeCount: UILabel!
    @IBOutlet weak var bubbleSlider: UISlider!
    @IBOutlet weak var bubbleCount: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
     }
    
    @IBAction func timeSlide(_ sender: UISlider) {
        timeCount.text = String(Int(sender.value))
     }
    
    @IBAction func bubbleSlide(_ sender: UISlider) {
        bubbleCount.text = String(Int(sender.value))
    }
    
    @IBAction func play(_ sender: Any) {

        let gameRecord = playerName.text! + "#" + timeCount.text! + "#" + bubbleCount.text!
        let gameFileName = "GameFile"
        let rwt = ReadWriteFile()
        rwt.writeFile(writeString: gameRecord, to: gameFileName)
        print(rwt.readFile(from: gameFileName))

    }

    
}

