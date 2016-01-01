//
//  ViewController.swift
//  tapper
//
//  Created by JamesBottoms on 12/29/15.
//  Copyright © 2015 JamesBottoms. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    
    //Properties
    var maxTaps = 0
    var currentTaps = 0
    
    
    
    // Outlets
    @IBOutlet weak var titleLogoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    @IBOutlet weak var congratsLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    //Actions
    @IBAction func onCoinTap(Sender: UIButton!){
        currentTaps++
        updateTapsLabel()
        if isGameOver() {
            endGame()
        }
    }
    
    @IBAction func onPlayButtonPressed(sender: UIButton!){
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            
            titleLogoImg.hidden = true
            howManyTapsTxt.hidden = true
            playButton.hidden = true
            
            tapButton.hidden = false
            tapsLabel.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLabel()
        }
    }
    
    @IBAction func onPlayAgainPressed(sender: UIButton!){
        restartGame()
    }
    
    
    //Functions
    func updateTapsLabel (){
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    func isGameOver () -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func restartGame () {
        congratsLabel.hidden = true
        playAgainButton.hidden = true
        
        titleLogoImg.hidden = false
        howManyTapsTxt.hidden = false
        playButton.hidden = false
    }
    
    func endGame () {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        tapButton.hidden = true
        tapsLabel.hidden = true
        
        congratsLabel.hidden = false
        playAgainButton.hidden = false
    }
}

