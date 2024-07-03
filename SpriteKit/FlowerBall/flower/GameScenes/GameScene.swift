//
//  GameScene.swift
//  flower
//
//  Created by dave on 26/06/24.
//

import SpriteKit

class GameScene: SKScene {
    
    let xMid = 0
    let yMid = 0
    
    override func didMove(to view: SKView) {
        var w : CGFloat = self.size.width
        var h : CGFloat = self.size.height
        
        let label = SKLabelNode()
        label.text = "Touch and position a flower"
        label.fontSize = 45
        label.fontColor = SKColor.black
        label.position = CGPoint(x: xMid, y: yMid+100)
        scene?.addChild(label)
        
        let flower1 = SKSpriteNode(imageNamed: "flower-VO")
        flower1.position =  CGPoint(x: xMid+300, y: yMid+300)
        flower1.scale(to: CGSize(width: 100, height: 100))
        scene?.addChild(flower1)
        
        let flower2 = SKSpriteNode(imageNamed: "flower-VO")
        flower2.position =  CGPoint(x: xMid-300, y: yMid+300)
        flower2.scale(to: CGSize(width: 100, height: 100))
        scene?.addChild(flower2)
        
        let flower3 = SKSpriteNode(imageNamed: "flower-VO")
        flower3.position =  CGPoint(x: xMid+300, y: yMid-300)
        flower3.scale(to: CGSize(width: 100, height: 100))
        scene?.addChild(flower3)
        
        let flower4 = SKSpriteNode(imageNamed: "flower-VO")
        flower4.position =  CGPoint(x: xMid-300, y: yMid-300)
        flower4.scale(to: CGSize(width: 100, height: 100))
        scene?.addChild(flower4)
        
        let flower5 = SKSpriteNode(imageNamed: "flower-OY")
        flower5.position =  CGPoint(x: xMid, y: yMid)
        flower5.scale(to: CGSize(width: 100, height: 100))
        scene?.addChild(flower5)
        
        let flower6 = SKSpriteNode(imageNamed: "flower-BY")
        flower6.position =  CGPoint(x: w/2, y: h/2)
        flower6.scale(to: CGSize(width: 100, height: 100))
        scene?.addChild(flower6)
        
        let flower7 = SKSpriteNode(imageNamed: "flower-BY")
        flower7.position =  CGPoint(x: -w/2, y: h/2)
        flower7.scale(to: CGSize(width: 100, height: 100))
        scene?.addChild(flower7)
        
        let flower8 = SKSpriteNode(imageNamed: "flower-BY")
        flower8.position =  CGPoint(x: w/2, y: -h/2)
        flower8.scale(to: CGSize(width: 100, height: 100))
        scene?.addChild(flower8)
        
        let flower9 = SKSpriteNode(imageNamed: "flower-BY")
        flower9.position =  CGPoint(x: -w/2, y: -h/2)
        flower9.scale(to: CGSize(width: 100, height: 100))
        scene?.addChild(flower9)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        print(touchLocation)
        
        let i = Int.random(in: 0...3)
        var img: String = ""
        switch i {
            case 0: img = "flower-BY"
            case 1: img = "flower-GB"
            case 2: img = "flower-OY"
            case 3: img = "flower-VO"
        default:
            print("error")
        }
        let myflower = SKSpriteNode(imageNamed: img)
        myflower.position =  CGPoint(x: touchLocation.x, y: touchLocation.y)
        myflower.scale(to: CGSize(width: 100, height: 100))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        let myflower = SKSpriteNode(imageNamed: "flower-BY")
        myflower.position =  CGPoint(x: touchLocation.x, y: touchLocation.y)
        myflower.scale(to: CGSize(width: 100, height: 100))
        
        self.scene?.removeAllChildren()
        
        self.scene?.addChild(myflower)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        
        var lastNode : SKSpriteNode?
        
        var w : CGFloat = self.size.width
        var h : CGFloat = self.size.height
        
        var x : CGFloat = touchLocation.x
        var y : CGFloat = touchLocation.y
        
        var inverseX : Bool = false
        var inverseY : Bool = false
        
        
        Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { (_) in
            if(lastNode != nil){
                x = lastNode!.position.x
                y = lastNode!.position.y
                
                if(lastNode!.position.x >= w/2){
                    inverseX = true
                }
                if(lastNode!.position.x <= -w/2){
                    inverseX = false
                }
                if(lastNode!.position.y >= h/2){
                    inverseY = true
                }
                if(lastNode!.position.y <= -h/2){
                    inverseY = false
                }
            }
            
            if(inverseX){ x-=1 } else { x+=1 }
            if(inverseY){ y-=1 } else { y+=1 }
            
            var myflower = SKSpriteNode(imageNamed: "flower-BY")
            if(lastNode != nil){
                myflower = lastNode!
            }
            myflower.position = CGPoint(
                x: x,
                y: y
            )
            myflower.scale(to: CGSize(width: 100, height: 100))
            
            self.scene?.removeAllChildren()
            
            self.scene?.addChild(myflower)
            lastNode = myflower
        }
    }
}
