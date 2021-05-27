

import UIKit

class pong: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var p1: UIView!
    
    @IBOutlet weak var ball: UIView!
    
    @IBOutlet weak var p2: UIView!
    
    
    var dynamicAnimator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var collisionBehavior :UICollisionBehavior!
    var ballDynamicItem: UIDynamicItemBehavior!
    var p1DynamicItem: UIDynamicItemBehavior!
    var p2DynamicItem: UIDynamicItemBehavior!
    
    var p1Score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ball.isHidden = true
        p1.isHidden = true
        p2.isHidden = true
        
    }
    
    @IBAction func pan1(_ sender: UIPanGestureRecognizer) {
        p1.center = CGPoint(x:sender.location(in: view).x,y: p1.center.y); dynamicAnimator.updateItem(usingCurrentState: p1)
        
        
    }
    
    @IBAction func pan2(_ sender: UIPanGestureRecognizer) {
        p2.center = CGPoint(x:sender.location(in: view).x,y: p2.center.y); dynamicAnimator.updateItem(usingCurrentState: p2)
        
    }
    func dynamicBehaviors(){
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        pushBehavior.active = true
        pushBehavior.setAngle(1.3, magnitude: 0.2)
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [ball, p1, p2])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .everything
        dynamicAnimator.addBehavior(collisionBehavior)
        
        collisionBehavior.collisionDelegate = self
        
        ballDynamicItem = UIDynamicItemBehavior(items: [ball])
        ballDynamicItem.allowsRotation = false
        ballDynamicItem.elasticity = 1.00
        ballDynamicItem.friction = 0
        ballDynamicItem.resistance = 0
        dynamicAnimator.addBehavior(ballDynamicItem)
        
        p1DynamicItem = UIDynamicItemBehavior(items: [p1])
        p1DynamicItem.density = 1000000
        p1DynamicItem.allowsRotation = false
        p1DynamicItem.elasticity = 1.00
        p1DynamicItem.friction = 0
        p1DynamicItem.resistance = 0
        dynamicAnimator.addBehavior(p1DynamicItem)
        
        p2DynamicItem = UIDynamicItemBehavior(items: [p2])
        p2DynamicItem.density = 1000000
        p2DynamicItem.allowsRotation = false
        p2DynamicItem.elasticity = 1.00
        p2DynamicItem.friction = 0
        p2DynamicItem.resistance = 0
        dynamicAnimator.addBehavior(p2DynamicItem)
        
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if p.y > p1.center.y + 10 {
            
        }
    }
    
    @IBAction func startButton(_ sender: Any) {
        ball.isHidden = false
        p1.isHidden = false
        p2.isHidden = false
        dynamicBehaviors()
        
    }
    func p1alert(){
        let addAlert = UIAlertController(title: "took you long enough!", message: "let's make things harder", preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "next level", style: .default) { [self] (action) in
        
            p1Score += 1
            pushBehavior.magnitude = 0
        }
    
    }
    
}
