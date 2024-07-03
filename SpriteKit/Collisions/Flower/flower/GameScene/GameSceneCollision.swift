//
//  GameSceneCollision.swift
//  flower
//
//  Created by dave on 26/06/24.
//

import SpriteKit
import SwiftUI

class GameSceneCollision: SKScene, SKPhysicsContactDelegate {
    
    var collisions = 0
    var collisionCounter = SKLabelNode()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        let xPos = (scene?.size.width)!/2
        let yPos = (scene?.size.height)!/1.3
        let flowerDim = (scene?.size.width)!/8
        
        let flower1 = SKSpriteNode(imageNamed: "flower-BY")
        flower1.name = "Flower BY"
        flower1.position = CGPoint(x: -xPos/1.2, y: yPos/2)
        flower1.size = CGSize(width: flowerDim, height: flowerDim)
        
        flower1.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(flowerDim/2))
        flower1.physicsBody?.mass = 0.01
        flower1.physicsBody?.affectedByGravity = true
        flower1.physicsBody?.categoryBitMask = 1
        flower1.physicsBody?.collisionBitMask = 24
        flower1.physicsBody?.contactTestBitMask = 24
        scene?.addChild(flower1)
        
        let flower2 = SKSpriteNode(imageNamed: "flower-OY")
        flower2.name = "Flower OY"
        flower2.position = CGPoint(x: -xPos/1.9, y: yPos/2)
        flower2.size = CGSize(width: flowerDim, height: flowerDim)
        
        flower2.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(flowerDim/2))
        flower2.physicsBody?.mass = 0.01
        flower2.physicsBody?.affectedByGravity = true
        flower2.physicsBody?.categoryBitMask = 2
        flower2.physicsBody?.collisionBitMask = 16
        flower2.physicsBody?.contactTestBitMask = 24
        scene?.addChild(flower2)
        
        let flower3 = SKSpriteNode(imageNamed: "flower-VO")
        flower3.name = "Flower VO"
        flower3.position = CGPoint(x: -xPos/4.8, y: yPos/2)
        flower3.size = CGSize(width: flowerDim, height: flowerDim)
        
        flower3.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(flowerDim/2))
        flower3.physicsBody?.mass = 0.01
        flower3.physicsBody?.affectedByGravity = true
        flower3.physicsBody?.categoryBitMask = 4
        flower3.physicsBody?.collisionBitMask = 0
        flower3.physicsBody?.contactTestBitMask = 24
        scene?.addChild(flower3)
        
        let shapeBlu = SKSpriteNode(color: UIColor.blue, size: CGSize(width: CGFloat(350), height: CGFloat(30)))
        shapeBlu.zRotation = CGFloat(2.5)
        shapeBlu.position = CGPoint(x: -300, y: 200)
        shapeBlu.physicsBody = SKPhysicsBody(
            rectangleOf: CGSize(
                width: shapeBlu.size.width, height: shapeBlu.size.height
            )
        )
        shapeBlu.physicsBody?.affectedByGravity = false
        shapeBlu.physicsBody?.categoryBitMask = 8
        shapeBlu.physicsBody?.collisionBitMask = 0
        
        scene?.addChild(shapeBlu)
        
        let shapeWhite = SKSpriteNode(color: UIColor.white, size: CGSize(width: CGFloat(800), height: CGFloat(30)))
        shapeWhite.position = CGPoint(x: 0, y: -400)
        shapeWhite.physicsBody = SKPhysicsBody(
            rectangleOf: CGSize(
                width: shapeWhite.size.width, height: shapeWhite.size.height
            )
        )
        shapeWhite.physicsBody?.affectedByGravity = false
        shapeWhite.physicsBody?.categoryBitMask = 16
        shapeWhite.physicsBody?.collisionBitMask = 0
        
        scene?.addChild(shapeWhite)
        
        let shapeWhiteAlt = SKSpriteNode(color: UIColor.white, size: CGSize(width: CGFloat(800), height: CGFloat(30)))
        shapeWhiteAlt.position = CGPoint(x: 300, y: 0)
        shapeWhiteAlt.zRotation = CGFloat(1.58)
        shapeWhiteAlt.physicsBody = SKPhysicsBody(
            rectangleOf: CGSize(
                width: shapeWhiteAlt.size.width, height: shapeWhiteAlt.size.height
            )
        )
        shapeWhiteAlt.physicsBody?.affectedByGravity = false
        shapeWhiteAlt.physicsBody?.categoryBitMask = 16
        shapeWhiteAlt.physicsBody?.collisionBitMask = 0
        
        scene?.addChild(shapeWhiteAlt)
        
        flower1.physicsBody?.applyImpulse(CGVector(dx: 0, dy: -3))
        flower2.physicsBody?.applyImpulse(CGVector(dx: 0, dy: -3))
        flower3.physicsBody?.applyImpulse(CGVector(dx: 0, dy: -3))
        
        //physicsWorld.gravity = .zero
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print(contact)
        if (contact.bodyA.categoryBitMask == 1) || (contact.bodyB.categoryBitMask == 1) {
            onCollision(contact.bodyA.node, contact.bodyB.node)
        } else if (contact.bodyA.categoryBitMask == 2) || (contact.bodyB.categoryBitMask == 2) {
            collisions += 1
            collisionCounter.text = "Collisions: \(collisions)"
        } else if (contact.bodyA.categoryBitMask == 4) || (contact.bodyB.categoryBitMask == 4) {
            collisions += 1
            collisionCounter.text = "Collisions: \(collisions)"
        }
    }
    
    func onCollision(_ a: SKNode?, _ b: SKNode?){
        print("Collisions of \(a?.name ?? "unknown") and \(b?.name ?? "unknown")")
        
        collisions += 1
        collisionCounter.text = "Collisions: \(collisions)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
        
}

