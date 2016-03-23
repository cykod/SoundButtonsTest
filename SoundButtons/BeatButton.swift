//
//  BeatButton.swift
//  SoundButtons
//
//  Created by Pascal Rettig on 3/18/16.
//  Copyright © 2016 Pascal Rettig. All rights reserved.
//

import UIKit
import AVFoundation

class BeatButton: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    let bgColor = UIColor.init(colorLiteralRed: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    let borderColor = UIColor.init(colorLiteralRed: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
    
    let soundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("random_sound", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    var active = false

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = bgColor
        self.layer.cornerRadius = 5.0;
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.whiteColor().CGColor
        
        try! audioPlayer = AVAudioPlayer(contentsOfURL: soundURL, fileTypeHint: "wav")
        audioPlayer.prepareToPlay()
    }
    
    override func touchesBegan(touches: Set<UITouch>,
        withEvent event: UIEvent?) {
            if(!self.active) {
                self.active = true;
                activateButton();
            } else {
                self.active = false
                deactivateButton();
            }
    }
    
    func activateButton() {
        UIView.animateWithDuration(0.2) {
            self.backgroundColor = UIColor.redColor()
        }
    }
    
    func deactivateButton() {
        UIView.animateWithDuration(0.2) {
            self.backgroundColor = self.bgColor
        }

    }
    
    func highlightButton() {
        dispatch_async(dispatch_get_main_queue(), {
            self.layer.borderColor = self.borderColor.CGColor
            if(self.active) {
                self.audioPlayer.play()
            }
        })
    }
    
    func dehighlightButton() {
        dispatch_async(dispatch_get_main_queue(), {
            self.layer.borderColor = UIColor.whiteColor().CGColor
        })
    }
}
