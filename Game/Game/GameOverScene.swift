//
//  GameOverScene.swift
//  Game
//
//  Created by Helaine Pontes on 07/10/20.
//

import UIKit
import SpriteKit
import GameplayKit

class GameOverScene: SKScene {
    var notificationLabel = SKLabelNode(text: "You Loose")
    
    var backToMenuButton = UIButton()
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 28/255)
        
        addChild(notificationLabel)
        notificationLabel.fontSize = 70
        notificationLabel.color = SKColor.white
        notificationLabel.fontName = "LLPixel"
        notificationLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
