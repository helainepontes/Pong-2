//
//  WinVC.swift
//  Game
//
//  Created by Helaine Pontes on 07/10/20.
//

import UIKit
import SpriteKit
import GameplayKit

class WinVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "WinScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                scene.size = view.bounds.size
                // Present the scene
                view.presentScene(scene)
                
            }
        }

    }
}
