//
//  GameViewController.swift
//  BubblePop
//
//  Created by user135601 on 5/4/18.
//  Copyright © 2018 Abdol Vatandoust. All rights reserved.
//

import UIKit
import GameKit

struct Settings {
    let playTime: TimeInterval
    let maxBubbles: Int
    var score: Int
}



class GameViewController: UIViewController {
    let randomSource: GKRandomSource = GKARC4RandomSource()
    var randomX = CGFloat()
    var randomY = CGFloat()
    var myTable = [[Int]]()
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var maxBubble: UILabel!
    var playerName: String?
    var settings: Settings?
    @objc var timeCounter = 60
    var score = 0
    var bubbles = [UIImageView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initBubbleTable(x:Int(self.view.frame.width),y:Int(self.view.frame.height))
        for _ in 1...15 {
           randomX = CGFloat(randomSource.nextUniform()) * (self.view.frame.width-60)
           randomY = CGFloat(randomSource.nextUniform()) * (self.view.frame.height-60)
            if checkBubblePosition(x: Int(randomX), y: Int(randomY)){
                let bubbleImage = UIImage.init(imageLiteralResourceName: randomBubbleType())
                let bubbleView = UIImageView(image: bubbleImage)
                bubbleView.frame = CGRect(x: randomX, y: randomY, width: 60.0, height: 60.0)
                let tapHandler = UITapGestureRecognizer(target: self, action: #selector(bubbleTapped(_:)))
                bubbleView.addGestureRecognizer(tapHandler)
                bubbles.append(bubbleView)
                
            }
           
        }
        displayBubbles(bubbles: bubbles)
        
        
    }
    func initBubbleTable(x: Int, y: Int){
    
        for i in 0...x {
            myTable.append( [] )
            for _ in 0...y {
                myTable[i].append( 1 )
            }
        }
    }
        
    func checkBubblePosition(x: Int, y: Int) -> Bool {
        if randomY < 80 { randomY = 80 }
            return true
    }
    func displayBubbles(bubbles: [UIImageView] ){
        
        for images in bubbles{
            self.view.addSubview(images)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
      
    }
    override func viewWillDisappear(_ animated: Bool) {

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameScene = segue.destination as? GameViewController {
            gameScene.playerName = "..."
            gameScene.settings = self.settings
        }
    }

    @IBAction func bubbleTapped(_ sender: BubbleView) {
        self.score += sender.bubbleType!.points
        sender.removeFromSuperview()
    }
    
    func randomBubbleType() -> String {
        var bag: [String] = []
        for _ in 1...40 {
            bag.append("bRed.jpeg")
        }
        for _ in 1...30 {
            bag.append("bPink.jpeg")
        }
        for _ in 1...15 {
            bag.append("bGreen.jpeg")
        }
        for _ in 1...10 {
            bag.append("bBlue.jpeg")
        }
        for _ in 1...5 {
            bag.append("bBlack.jpeg")
        }
        let choice: Int = randomSource.nextInt(upperBound: bag.count)
        return bag[choice]
    }
}

    


