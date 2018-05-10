//
//  createBubble.swift
//  BubblePop
//
//  Created by user135601 on 5/8/18.
//  Copyright © 2018 Abdol Vatandoust. All rights reserved.
//

import GameKit
class BubbleType {
    var color: UIColor
    let points: Int = 0
    init(){
        color = .blue
    }
}

class BubbleView: UIButton {
    var bubbleType: BubbleType?
}


class createBubble: UIViewController {
    let randomSource: GKRandomSource = GKARC4RandomSource()
    var bubbleView = BubbleView(frame: CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0))
    let bubbleImage = UIImage.init(imageLiteralResourceName: "bBlue.jpeg")
    override func viewDidLoad() {
        super.viewDidLoad()
        bubbleView.setImage(bubbleImage, for: UIControlState.normal)
       // bubbleView.addTarget(self, action: #selector(UIButton.action(_:)) , for:UIControlEvents.touchUpInside)
        self.view.addSubview(bubbleView)        // Do any additional setup after loading the view.
    }
    func randomBubbleType() -> UIColor {
        var bag: [UIColor] = []
        for _ in 1...40 {
            bag.append(.red)
        }
        for _ in 1...30 {
            bag.append(.magenta)
        }
        for _ in 1...15 {
            bag.append(.green)
        }
        for _ in 1...10 {
            bag.append(.blue)
        }
        for _ in 1...5 {
            bag.append(.black)
        }
        
        let choice: Int = randomSource.nextInt(upperBound: bag.count)
        return bag[choice]
    }
    func createBubble(at position:CGPoint) {
        let randomX = CGFloat(randomSource.nextUniform()) * (self.view.frame.width-60)
        let randomY = CGFloat(randomSource.nextUniform()) * (self.view.frame.height-60)
        let bubbleView = BubbleView(frame: CGRect(x: randomX, y: randomY, width: 60, height: 60))
        bubbleView.bubbleType?.color = self.randomBubbleType()
    //    bubbleView.addTarget(self, action: #selector(bubbleTapped(_:)), for: .touchUpInside)
        self.view.addSubview(bubbleView)
    }
}
