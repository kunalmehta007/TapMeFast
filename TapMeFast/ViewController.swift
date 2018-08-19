//
//  ViewController.swift
//  TapMeFast
//
//  Created by Kunal Mehta on 15/07/18.
//  Copyright © 2018 Kunal Mehta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerlabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var TapMeButton: UIButton!
    @IBOutlet weak var startgamebutton: UIButton!
    
    var timer = Timer()
    
    var timeInt = 0
    var TapInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeInt = 10
        TapInt = 0
        
        timerlabel.text = String(timeInt)
        scorelabel.text = String(TapInt)
        
        TapMeButton.isEnabled = false
        TapMeButton.alpha = 0.5
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func TapMe(_ sender: Any) {
        
        TapInt += 1
        scorelabel.text = String(TapInt)
    
    }
    
    @IBAction func StartGame(_ sender: Any) {
        
        if timeInt == 10 {
            
            TapInt = 0
            scorelabel.text = String(TapInt)
            
            TapMeButton.isEnabled = true
            TapMeButton.alpha = 1
            
            startgamebutton.isEnabled = false
            startgamebutton.alpha = 0.5
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startcounter), userInfo: nil, repeats: true)
            
        }
        
        if timeInt == 0 {
            timeInt = 10
            TapInt = 0
            
            timerlabel.text = String(timeInt)
            scorelabel.text = String(TapInt)
            
            startgamebutton.setTitle("START GAME", for: [])
            
        }
        
    }
    
    @objc func startcounter() {
        timeInt -= 1
        timerlabel.text = String(timeInt)
        
        if timeInt == 0 {
            timer.invalidate()
            TapMeButton.isEnabled = false
            TapMeButton.alpha = 0.5
            
            startgamebutton.isEnabled = true
            startgamebutton.alpha = 1
            
            startgamebutton.setTitle("RESTART", for: [])
        }
    }
    
    
    
    
}

