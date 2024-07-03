//
//  GameScene.swift
//  flower
//
//  Created by dave on 26/06/24.
//

import SpriteKit

class GameSceneLabel: SKScene {
    
    var label = SKLabelNode()
    var previousTime = TimeInterval()
    
    var timerValue = 0
    
    override func didMove(to view: SKView) {
        label = SKLabelNode()
        label.fontSize = 100
        label.position = CGPoint(x: 0, y: 250)
        label.text = String(timerValue)
        scene?.addChild(label)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if(previousTime > 0){
            if(currentTime - previousTime) > 1{
                previousTime = currentTime
                timerValue += 1
                label.text = String(timerValue)
            }
        } else {
            previousTime =  currentTime
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
        
}
