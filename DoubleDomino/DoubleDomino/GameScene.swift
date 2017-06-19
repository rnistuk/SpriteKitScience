import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var resetButton : SKSpriteNode?
    private var positions : [(SKSpriteNode,(CGPoint,CGFloat))]?
    
    override func didMove(to view: SKView) {
        let bricks = findBricks()
        self.positions = bricks.map { ($0,($0.position, $0.zRotation)) }
        self.resetButton = self.childNode(withName: "//ResetButton") as? SKSpriteNode
    }
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func mouseDown(with event: NSEvent) {
        let p = event.location(in:self)
        let reset = self.nodes(at:p).reduce(false){ (ret,o) in ret || o.name == "ResetButton" || o.name == "Reset" }
        if(reset) {
            for i in self.positions! {
                i.0.position = i.1.0
                i.0.zRotation = i.1.1
            }
        }
    }
    
    
    override func mouseDragged(with event: NSEvent) { }
    
    override func mouseUp(with event: NSEvent) { }
    
    override func keyDown(with event: NSEvent) { }
    
    override func update(_ currentTime: TimeInterval) { }
    
    func isBrick(b:SKNode) -> Bool { return b.name! == "Brick" }
    
    func findBricks() -> [SKSpriteNode] {  return children.filter(isBrick) as! [SKSpriteNode]  }
    
    
}
