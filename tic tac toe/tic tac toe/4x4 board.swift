//
//  4x4 board.swift
//  tic tac toe
//
//  Created by period2 on 4/23/21.
//

import UIKit

class _x4_board: UIViewController {

    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var label7: UILabel!
    
    @IBOutlet weak var label8: UILabel!
    
    @IBOutlet weak var label9: UILabel!
    
    @IBOutlet weak var label10: UILabel!
    
    @IBOutlet weak var label11: UILabel!
    
    @IBOutlet weak var label12: UILabel!
    
    @IBOutlet weak var label13: UILabel!
    
    @IBOutlet weak var label14: UILabel!
    
    @IBOutlet weak var label15: UILabel!
    
    @IBOutlet weak var label16: UILabel!
    
    
    @IBOutlet var tapOutlet: UITapGestureRecognizer!
    
    var allLabels: [UILabel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        allLabels = [label1,label2,label3,label4,label5,label6,label7,label8,label9,label10,label11,label12,label13,label14,label15,label16]
        
        turnLabel.text = "X"
        
    }
    

    

        
        
        
    }

