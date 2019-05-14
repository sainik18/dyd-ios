//
//  UIButtonDesigns.swift
//  DYD
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton:UIButton
{
    @IBInspectable var borderColor:UIColor = UIColor.clear{
        didSet {
            layer.borderColor = borderColor.cgColor
            layer.masksToBounds = true
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = borderWidth>0
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0{
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0{
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowColor: UIColor? = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0) {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    
}


