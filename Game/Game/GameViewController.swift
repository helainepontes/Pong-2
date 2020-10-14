//
//  GameViewController.swift
//  GamePong
//
//  Created by Helaine Pontes on 07/10/20.
//

import UIKit
import SpriteKit
import GameplayKit


var currentGameType = gameType.medium


class GameViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton! {
        didSet {
            backButton.isHidden = true
            backButton.alpha = 0
            backButton.addTarget(self, action: #selector(backToMenu), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                scene.size = view.bounds.size
                // Present the scene
                view.presentScene(scene)
                
            }
            navigationController?.setNavigationBarHidden(true, animated: true)
            view.ignoresSiblingOrder = true
//            view.showsFPS = true
//            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func showBackButton() {
        backButton.isHidden = false
        UIView.animate(withDuration: 0.8) {
            self.backButton.alpha = 1
        }
    }
    
    @objc func backToMenu() {
        navigationController?.popViewController(animated: true)
    }
}
