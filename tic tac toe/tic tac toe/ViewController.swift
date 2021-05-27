

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    @IBOutlet weak var labelNine: UILabel!
    
    @IBOutlet var tapOutlet: UITapGestureRecognizer!
    @IBOutlet weak var winnerLabel: UILabel!
    
    var labels:[UILabel] = []
        
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var XScore = 0
    var OScore = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labels = [labelOne, labelTwo, labelThree, labelFour, labelFive, labelSix, labelSeven, labelEight, labelNine]
        
        
        turnLabel.text = "X"
        
        winnerLabel.isHidden = true
    }

    func placeInToLabel(MyLabel: UILabel) {
        if MyLabel.text == "" {
            if turnLabel.text == "X"{
                
            MyLabel.text = turnLabel.text
            turnLabel.text = "O"
            }
        
            else  {
            MyLabel.text = turnLabel.text
            turnLabel.text = "X"
        
            }
        }
    }
    
func checkForWinner (){
   
    if labelOne.text == labelTwo.text && labelTwo.text == labelThree.text && labelOne.text != "" {
        winnerLabel.text = labelOne.text! + " Wins!"
        alert()
        score()
            
    }
    if labelFour.text == labelFive.text && labelFive.text == labelSix.text && labelFour.text != "" {
        winnerLabel.text = labelFour.text! + " Wins!"
        alert()
        score()
            
        
    }
    if labelSeven.text == labelEight.text && labelEight.text == labelNine.text && labelSeven.text != "" {
        winnerLabel.text = labelSeven.text! + " Wins!"
        alert()
        score()
            
    }
    if labelOne.text == labelFour.text && labelFour.text == labelSeven.text && labelOne.text != "" {
        winnerLabel.text = labelOne.text! + " Wins!"
        alert()
        score()
            
    }
    if labelTwo.text == labelFive.text && labelFive.text == labelEight.text && labelTwo.text != "" {
        winnerLabel.text = labelTwo.text! + " Wins!"
        alert()
        score()

            
    }
    if labelThree.text == labelSix.text && labelSix.text == labelNine.text && labelThree.text != "" {
        winnerLabel.text = labelThree.text! + " Wins!"
        alert()
        score()

            
    }
    if labelOne.text == labelFive.text && labelFive.text == labelNine.text && labelOne.text != "" {
        winnerLabel.text = labelOne.text! + " Wins!"
        alert()
        score()

            
    }
    if labelThree.text == labelFive.text && labelFive.text == labelSeven.text && labelThree.text != "" {
        winnerLabel.text = labelThree.text! + " Wins!"
        alert()
        score()

    }

    }

   func catsGame ()
   {
    if labelOne.text != "", labelTwo.text != "", labelThree.text != "", labelFour.text != "", labelFive.text != "", labelSix.text != "", labelSeven.text != "", labelEight.text != "", labelNine.text != ""
    {
        winnerLabel.text = "Cat's Game!"
        alert()
    }
   }
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer)
    {
    let point = sender.location(in: myView)
        for label in labels{
            if label.frame.contains(point){
                placeInToLabel(MyLabel: label)
            }
        }
        checkForWinner()
        catsGame()
    
        }
    
    func reset(){
        labelOne.text = ""
        labelTwo.text = ""
        labelThree.text = ""
        labelFour.text = ""
        labelFive.text = ""
        labelSix.text = ""
        labelSeven.text = ""
        labelEight.text = ""
        labelNine.text = ""
        winnerLabel.text = ""

    }
    
    func alert() {
        let addAlert = UIAlertController(title: winnerLabel.text, message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "New Game!", style: .default) { [self] (action) in
            self.reset()
            if self.winnerLabel.text == "X Wins!"{
               XScore += 1
                self.scoreLabel.text = "\(XScore) - \(OScore)"
                
                }
             if winnerLabel.text == "O Wins!"{
                OScore += 1
                scoreLabel.text =  "\(XScore) - \(OScore)"
            }
            
        }
        
        addAlert.addAction(doneAction)
        present(addAlert, animated: true, completion: nil)

    }
    
    func score(){
        if self.winnerLabel.text == "X Wins!"{
           XScore += 1
            self.scoreLabel.text = "\(XScore) - \(OScore)"
        }
            if winnerLabel.text == "O Wins!"{
               OScore += 1
               scoreLabel.text =  "\(XScore) - \(OScore)"
           }

    }

}
