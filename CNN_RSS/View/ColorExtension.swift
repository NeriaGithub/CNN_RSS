//
//  ColorExtension.swift
//  CNN_RSS
//
//  Created by Neria Jerafi on 31/10/2020.
//

import Foundation
import UIKit

extension UIColor{
    
    // Returns random color
    static func random () -> UIColor {
        return UIColor(
          red: CGFloat.random(in: 0...1),
          green: CGFloat.random(in: 0...1),
          blue: CGFloat.random(in: 0...1),
          alpha: 1.0)
      }
    // Returns black if the given background color is light or white if the given color is dark

   static func textColor(bgColor: UIColor) -> UIColor {
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        
        bgColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        brightness = ((r * 299) + (g * 587) + (b * 114)) / 1000;
        if (brightness < 0.5) {
            return UIColor.white
        }
        else {
            return UIColor.black
        }
    }
}

