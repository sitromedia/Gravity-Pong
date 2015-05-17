//
//  startGameScene.swift
//  bababomb
//
//  Created by Neptune on 5/1/15.
//  Copyright (c) 2015 Sitro Consulting Group. All rights reserved.
//

import Foundation
import SpriteKit

class BlackHoleScene: SKScene {
    
    let label = SKLabelNode(fontNamed: "HelveticaNeue-CondensedBlack ")
    let label1 = SKLabelNode(fontNamed: "AppleSDGothicNeo-SemiBold")
    let label2 = SKLabelNode(fontNamed: "AppleSDGothicNeo-SemiBold")
    let label3 = SKLabelNode(fontNamed: "AppleSDGothicNeo-SemiBold")
    let label4 = SKLabelNode(fontNamed: "AppleSDGothicNeo-SemiBold")
    
    func swipedRight(sender:UISwipeGestureRecognizer){
        println("swiped right")
        let scene = PlayerIconScene(size: size)
        scene.scaleMode = .ResizeFill
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let reveal = SKTransition.revealWithDirection(SKTransitionDirection.Right, duration: 0.3)
        self.view?.presentScene(scene, transition: reveal)
    }
    
    func swipedLeft(sender:UISwipeGestureRecognizer){
        println("swiped left")
        let scene = SunIconScene(size: size)
        scene.scaleMode = .ResizeFill
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let reveal = SKTransition.revealWithDirection(SKTransitionDirection.Left, duration: 0.3)
        self.view?.presentScene(scene, transition: reveal)

    }
    
    override func didMoveToView(view: SKView) {
        
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedRight:"))
        swipeRight.direction = .Right
        view.addGestureRecognizer(swipeRight)
        
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedLeft:"))
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches{
            if (touch.tapCount == 2){
                let location = touch.locationInNode(self)
                let scene = GameScene(size: size)
                scene.scaleMode = .ResizeFill
                scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                let reveal = SKTransition.pushWithDirection(SKTransitionDirection.Up, duration: 0.3)
                reveal.pausesOutgoingScene = true
                self.view?.presentScene(scene, transition: reveal)
            }
        }
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        let bg = SKSpriteNode(imageNamed: "background")
        println("test")
        
        bg.size.height = self.size.height
        bg.size.width = self.size.width
        addChild(bg)
        let scene = GameScene(size: size)
        scene.scaleMode = .ResizeFill
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        var snowEmitterNode = SKEmitterNode(fileNamed: "SnowParticles.sks")
        self.addChild(snowEmitterNode)
        
        var message1 = "BLACKHOLE"
        var message2 = "Use their gravitational fields to balance Earth. "
        var message3 = "If you get to close you will get sucked in. "
        
        let blackhole = SKSpriteNode(imageNamed: "blackhole")
        blackhole.size = CGSize(width: 100, height: 100)
        blackhole.position = CGPoint(x: 0, y: 90)
        
        label.text = message1
        label.fontSize = 26
        label.fontColor = SKColor.whiteColor()
        label.position = CGPoint(x: 0, y: -0)
        
        label1.text = message2
        label1.fontSize = 16
        label1.fontColor = SKColor.whiteColor()
        label1.position = CGPoint(x: 0, y: -20)
        
        label2.text = message3
        label2.fontSize = 16
        label2.fontColor = SKColor.whiteColor()
        label2.position = CGPoint(x: 0, y: -40)
        
        addChild(blackhole)
        addChild(label)
        addChild(label1)
        addChild(label2)

        
    }
    
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}