//
//  Extensions.swift
//  Power
//
//  Created by Chris Gonzaga on 8/22/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import UIKit


extension UIColor {
    
    static let tealColor = UIColor(red: 48/255, green: 164/255, blue: 182/255, alpha: 1)
    
    static let lightRed = UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
    
    static let darkBlue = UIColor(red: 9/255, green: 45/255, blue: 64/255, alpha: 1)
    
    static let lightBlue = UIColor(red: 218/255, green: 235/255, blue: 243/255, alpha: 1)
    
    static let logoYellow = UIColor(red: 250/255, green: 215/255, blue: 158/255, alpha: 1)
    
    static let logoGreen = UIColor(red: 95/255, green: 198/255, blue: 45/255, alpha: 1)
    
    static let lightGreen = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
    
    static let darkGreen = UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 0)
    
    static let gloomyBackground = UIColor(red: 28/255, green: 56/255, blue: 77/255, alpha: 1)
    
    static let gloomyFont = UIColor(red: 27/255, green: 99/255, blue: 135/255, alpha: 1)
    
    static let gloomyPlaceHolderFont = UIColor(red: 57/255, green: 89/255, blue: 118/255, alpha: 1)
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}


extension UITabBarController {
    func hideTabBarAnimated(hide:Bool) {
        UIView.animate(withDuration: 2, animations: {
            if hide {
                self.tabBar.transform = CGAffineTransform(translationX: 0, y: 0)
            } else {
                self.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
            }
        })
    }
}


extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func center(x: NSLayoutXAxisAnchor?, y: NSLayoutYAxisAnchor? ) {
        
        translatesAutoresizingMaskIntoConstraints = false

        if let x = x {
            centerXAnchor.constraint(equalTo: x).isActive = true
        }
        
        if let y = y {
            centerYAnchor.constraint(equalTo: y).isActive = true
        }
    }
    
    func fadeViewInThenOut(view1: UIView, view2: UIView, delay: TimeInterval) {
        
        
        UIView.animate(withDuration: 16, delay: delay, options: [UIViewAnimationOptions.repeat, UIViewAnimationOptions.autoreverse], animations: {
            _ = [view1.alpha = 1, view2.alpha = 0];
            _ = [view1.alpha = 0, view2.alpha = 1]
        }, completion: nil)
 
        
    }
}

extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week
        
        let quotient: Int
        let unit: String
        if secondsAgo < minute {
            quotient = secondsAgo
            unit = "second"
        } else if secondsAgo < hour {
            quotient = secondsAgo / minute
            unit = "min"
        } else if secondsAgo < day {
            quotient = secondsAgo / hour
            unit = "hour"
        } else if secondsAgo < week {
            quotient = secondsAgo / day
            unit = "day"
        } else if secondsAgo < month {
            quotient = secondsAgo / week
            unit = "week"
        } else {
            quotient = secondsAgo / month
            unit = "month"
        }
        
        return "\(quotient) \(unit)\(quotient == 1 ? "" : "s") ago"
        
    }
}



extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}

