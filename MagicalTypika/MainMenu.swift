//
//  MainMenu.swift
//  Magical Typika
//
//  Created by Norma Tu on 7/12/16.
//  Copyright © 2016 NormaTu. All rights reserved.
//

import Foundation
import SpriteKit

enum GameState {
    case Loading, Playing, GameOver
}

class MainMenu: SKScene {
    
    var playButton: MSButtonNode!
    var creditsButton: MSButtonNode!
    var backgroundMusic: SKAudioNode!
    
    override func didMoveToView(view: SKView) {
        
        playButton = self.childNodeWithName("playButton") as! MSButtonNode
        creditsButton = self.childNodeWithName("creditsButton") as! MSButtonNode
        
        playButton.selectedHandler =  {
            
            let scene = GameScene(size: view.frame.size)

            // Configure the view.
            let skView = self.view!
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .ResizeFill
            
            skView.presentScene(scene)
            
            self.playButton.removeFromParent()
        }
        
        creditsButton.selectedHandler = {
            
            let scene = CreditsScene(size: view.frame.size)
            
            // Configure the view.
            let skView = self.view!
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .ResizeFill
            
            skView.presentScene(scene)
            
            self.creditsButton.removeFromParent()
        }
        
       
        if let musicURL = NSBundle.mainBundle().URLForResource("mainMenuBGM", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(URL: musicURL)
            backgroundMusic.autoplayLooped = true
            
            addChild(backgroundMusic)
        }

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
    
}