//
//  ViewController.swift
//  Stopwatch
//
//  Created by voodoo15 on 2016-02-24.
//  Copyright © 2016 voodoo15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Global Variables
    
    var seconds:Int = 0
    var minutes:Int = 0
    var hours:Int = 0
    var count:Bool = false
    
    //Outlets
    
    @IBOutlet var display: UILabel!

    @IBAction func Start(sender: AnyObject) {

        //Start timer and change colour to black
        
        count = true
       
        display.textColor = UIColor.blackColor()
        
        
    }

   
    @IBAction func Stop(sender: AnyObject) {
        
        //Stop timer and change colour to red
        
        count = false
      
        display.textColor = UIColor.redColor()
        
    }
    
    @IBAction func Reset(sender: AnyObject) {
        
        //Stop timer, change colour to red and reset timer to 0
        
        seconds = 0
        
        minutes = 0
        
        hours = 0
        
        count = false
        
        display.textColor = UIColor.redColor()
        
    }
    
    
    func result() {
        
        //Increase time by 1 second if play button is started and update timer label
        
        if count {
        
            seconds++
        
            if seconds == 60 {
            
                seconds = 0
            
                minutes++
            
            }
        
            if minutes == 60 {
        
                minutes = 0
            
                hours++
        
            }
        
        }
        
        display.text = "\(NSString(format:  "%02d", hours)):\(NSString(format:  "%02d", minutes)):\(NSString(format:  "%02d", seconds))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create timer
        
        var timer = NSTimer()
        
         timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

