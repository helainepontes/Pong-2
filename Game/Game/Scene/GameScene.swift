//
//  GameScene.swift
//  GamePong
//
//  Created by Helaine Pontes on 07/10/20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    
    var topLbl = SKLabelNode()
    var btmLbl = SKLabelNode()
    
    var score = [Int]()
    
    override func didMove(to view: SKView) {
        
        guard let lblTop = self.childNode(withName: "topLabel") as? SKLabelNode else{
            fatalError()
        }
        topLbl = lblTop
        btmLbl = self.childNode(withName: "btmLabel") as! SKLabelNode
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        print(self.view?.bounds.height as Any)
        
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        enemy.position.y = (self.frame.height / 2) - 50
        
        main = self.childNode(withName: "main") as! SKSpriteNode
        main.position.y = (-self.frame.height / 2) + 50
        
        let border  = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
        startGame()
    }
    
    func startGame() {
        score = [0,0]
        topLbl.text = "\(score[1])"
        btmLbl.text = "\(score[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: -10 , dy: -10))
    }
    
    func addScore(playerWhoWon : SKSpriteNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if playerWhoWon == main {
            if score[0] < 1 {
                score[0] += 1
                btmLbl.text = "\(score[0])"
                ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: -10))
            } else {
                displayWin()
            }
        }
        else if playerWhoWon == enemy {
            if score[1] < 1 {
                score[1] += 1
                topLbl.text = "\(score[1])"
                ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: -10))
            } else {
                displayGameOver()
            }
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentGameType == .player2 {
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0 {
                    
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }
                
            }
            else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
            
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentGameType == .player2 {
                if location.y > 0 {
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0 {
                    
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }
                
            }
            else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Chamado antes de cada frame renderizado
        
        
        switch currentGameType {
        case .easy:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.3))
            break
        case .medium:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
            break
        case .hard:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.7))
            break
        case .player2:
            
            break
        }

        if ball.position.y <= main.position.y - 30 {
            addScore(playerWhoWon: enemy)
        }
        else if ball.position.y >= enemy.position.y + 30 {
            addScore(playerWhoWon: main)
        }
    }
    
    func displayGameOver() {
        let gameOverScene = GameOverScene(size: size)
        gameOverScene.scaleMode = scaleMode
        
        let reveal = SKTransition.crossFade(withDuration: 0.5)
        view?.presentScene(gameOverScene, transition: reveal)
        if let navigationController = view?.window?.rootViewController as? UINavigationController,
           let viewController = navigationController.viewControllers[1] as? GameViewController {
            viewController.showBackButton()
        }
        SoundHelper.shared.playSound(ofType: .lose)
    }
    
    func displayWin() {
        let gameOverScene = WinScene(size: size)
        gameOverScene.scaleMode = scaleMode
        
        let reveal = SKTransition.crossFade(withDuration: 0.5)
        view?.presentScene(gameOverScene, transition: reveal)
        if let navigationController = view?.window?.rootViewController as? UINavigationController,
           let viewController = navigationController.viewControllers[1] as? GameViewController {
            viewController.showBackButton()
        }
        SoundHelper.shared.playSound(ofType: .win)
    }
}
