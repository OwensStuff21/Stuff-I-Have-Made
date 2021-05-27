
import UIKit

class Break_Out: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var ball: UIView!
    
    @IBOutlet weak var player: UIView!
    
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var startOutlet: UIButton!
    
    
    
    @IBOutlet weak var box1: UIView!
    @IBOutlet weak var box2: UIView!
    @IBOutlet weak var box3: UIView!
    @IBOutlet weak var box4: UIView!
    @IBOutlet weak var box5: UIView!
    @IBOutlet weak var box6: UIView!
    @IBOutlet weak var box7: UIView!
    @IBOutlet weak var box8: UIView!
    @IBOutlet weak var box9: UIView!
    @IBOutlet weak var box10: UIView!
    
    var boxes:[UIView] = []
    
    var dynamicAnimator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var collisionBehavior:UICollisionBehavior!
    var ballDynamicItem: UIDynamicItemBehavior!
    var playerDynamicItem: UIDynamicItemBehavior!
    var boxesDynamicItem: UIDynamicItemBehavior!
    
    var brickCount = 10
    
    var level = 3
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        boxes = [box1, box2, box3, box4, box5, box6, box7, box8, box9, box10]
        

        
        for box in boxes {
            box.backgroundColor = UIColor.white
        }

        
// makes the ball a circle
        
        ball.layer.cornerRadius = ball.frame.size.width / 2
        
        ball.isHidden = true
        player.isHidden = true
        levelLabel.isHidden = true
        buttonOutlet.isHidden = true
        levelLabel.text = "level \(level)"
        
    }
    
    var ballspeed: CGFloat!
    
    
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer)
    {
        player.center = CGPoint(x: sender.location(in:view).x, y: player.center.y)
        dynamicAnimator.updateItem(usingCurrentState: player)
    
    }
   
    func dynamicBehaviors(){
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        pushBehavior.active = true
        pushBehavior.setAngle(1.4, magnitude: 0.7)
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [ball, player,] + boxes)
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
        
        playerDynamicItem = UIDynamicItemBehavior(items: [player])
        playerDynamicItem.density = 10000000
        playerDynamicItem.allowsRotation = false
        playerDynamicItem.elasticity = 1.00
        playerDynamicItem.friction = 0
        playerDynamicItem.resistance = 0
        dynamicAnimator.addBehavior(playerDynamicItem)
        
        boxesDynamicItem = UIDynamicItemBehavior(items: boxes)
        boxesDynamicItem.elasticity = 1.00
        boxesDynamicItem.allowsRotation = false
        boxesDynamicItem.density = 10000
        dynamicAnimator.addBehavior(boxesDynamicItem)
    }
    
    
    
    
    
    
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        for box in boxes{
            if level <= 2 {
                if item1.isEqual(ball) && item2.isEqual(box) && box.backgroundColor == UIColor.red{
                box.isHidden = true
                collisionBehavior.removeItem(box)
                brickCount -= 1
            
            }
            else if item1.isEqual(ball) && item2.isEqual(box) && box.backgroundColor == UIColor.black{
                box.backgroundColor = UIColor.red
            
        }
            
            }
            
            if level > 2 {
                if item1.isEqual(ball) && item2.isEqual(box) && box.backgroundColor == UIColor.red{
                box.isHidden = true
                collisionBehavior.removeItem(box)
                brickCount -= 1
            
            }
            else if item1.isEqual(ball) && item2.isEqual(box) && box.backgroundColor == UIColor.blue{
                box.backgroundColor = UIColor.red
                
        }
            else if item1.isEqual(ball) && item2.isEqual(box) && box.backgroundColor == UIColor.black{
                box.backgroundColor = UIColor.blue
            }
            }
                if brickCount == 0{
                alert2()
            }
        
    }
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if boxes.count == 0{
            alert2()
            ballDynamicItem.resistance = 100000
            
        }
        else if p.y > player.center.y + 20  {
            alert()
            ballDynamicItem.resistance = 100000000
            
        }
    }
    
    func alert(){
        let addAlert = UIAlertController(title: "you're bad!", message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "New Game!", style: .default) { [self] (action) in
            self.reset()
            pushBehavior.magnitude = 0
            
            
        }
        
        addAlert.addAction(doneAction)
        present(addAlert, animated: true, completion: nil)

    }

    func alert2() {
        let addAlert = UIAlertController(title: "took you long enough!", message: "let's make things harder", preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "next level", style: .default) { [self] (action) in
            //ballspeed.magnitude += 0.3
            //pushBehavior.setAngle(1.5, magnitude: ballspeed.magnitude += 0.3)
            
            
            reset()
            level += 1
            levelLabel.text = "level \(level)"
            pushBehavior.magnitude = 0
            
        }
        
        addAlert.addAction(doneAction)
        present(addAlert, animated: true, completion: nil)

    
    }
    
    
    @IBAction func startButton(_ sender: UIButton) {
        dynamicBehaviors()
        sender.isHidden = true
        
        ball.isHidden = false
        player.isHidden = false
        levelLabel.isHidden = false

        for box in boxes {
            box.backgroundColor = UIColor.black
            //(red: 217/255, green: 255/255, blue: 237/255, alpha: 1)

        }
    }
    func reset(){
        boxes = [box1,box2,box3,box4,box5,box6,box7,box8,box9,box10]
        for box in boxes {
            box.isHidden = false
            box.backgroundColor = UIColor.black
        }
        startOutlet.isHidden = false
        brickCount = 10
        ball.isHidden = true
        //collisionBehavior.removeItem(ball)
        player.isHidden = true
      

        
    }
    
    @IBAction func centerButton(_ sender: UIButton) {
        print(ball.center.x)
        print(ball.center.y)
    
    }
    
}

