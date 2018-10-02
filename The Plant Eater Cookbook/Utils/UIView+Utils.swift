//
//  UIView+Utils.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 2/10/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import UIKit

extension UIView {
    
    func fadeIn(delay: Double = 0.5, duration: Double = 1.0, completion: (() -> Void)? = nil ) {
        self.fade(from: 0, to: 1, delay: delay, duration: duration, completion: completion)
    }
    
    func fadeOut(delay: Double = 0.5, duration: Double = 1.0, completion: (() -> Void)? = nil ) {
        self.fade(from: 1, to: 0, delay: delay, duration: duration, completion: completion)
    }
    
    private func fade(from startAlpha: Double, to endAlpha: Double, delay: Double = 0.5,
                      duration: Double = 1.0, completion: (() -> Void)? = nil ){
        self.alpha = CGFloat(startAlpha)
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.alpha = CGFloat(endAlpha)
        }) { (complete) in
            completion?()
        }
    }
    
}
