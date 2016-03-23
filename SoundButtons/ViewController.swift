//
//  ViewController.swift
//  SoundButtons
//
//  Created by Pascal Rettig on 3/18/16.
//  Copyright © 2016 Pascal Rettig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentButton = 0

    var timer : NSTimer?
    
    @IBOutlet var Buttons: [BeatButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSLog(String(Buttons.count))
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target:self, selector: Selector("runTimer"), userInfo: nil, repeats: true)
        
        Buttons[currentButton].highlightButton()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func runTimer() {
        Buttons[currentButton].dehighlightButton()
        currentButton += 1
        currentButton = currentButton % Buttons.count
        Buttons[currentButton].highlightButton()
    }

}

