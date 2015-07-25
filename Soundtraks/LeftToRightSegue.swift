//
//  LeftToRightSegue.swift
//  Soundtraks
//
//  Created by Rohan Daruwala on 7/19/15.
//  Copyright © 2015 New Trier Soundtraks. All rights reserved.
//

import UIKit

class LeftToRightSegue: UIStoryboardSegue {
    
    override func perform() {
        
        let source = self.sourceViewController as UIViewController
        let destination = self.destinationViewController as UIViewController
        
        var sourceFrame = source.view.frame
        sourceFrame.origin.x = -sourceFrame.size.width
        
        var destFrame = destination.view.frame
        destFrame.origin.x = destination.view.frame.size.width
        destination.view.frame = destFrame
        
        destFrame.origin.x = 0
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(destination.view, aboveSubview: source.view)
        
        source.view.superview?.addSubview(destination.view)
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            source.view.frame = sourceFrame
            destination.view.frame = destFrame
            
            }) { (Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as UIViewController,
                    animated: false,
                    completion: nil)
        }
        
    }
}
