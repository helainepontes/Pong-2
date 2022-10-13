//
//  WinScene.swift
//  Game
//
//  Created by Helaine Pontes on 08/10/20.
//

import UIKit
import SpriteKit
import GameplayKit

class WinScene: SKScene {
    var notificationLabel = SKLabelNode(text: "You Won")

    override init(size: CGSize) {
        super.init(size: size)
        self.name = "WinScene"
        self.backgroundColor = UIColor.gameColor

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

extension UIcolor {
    static let gameColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 28/255)
}
