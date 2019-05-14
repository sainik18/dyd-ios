//
//  UICustomizations.swift
//  DYD
//
//  Created by apple on 2/1/19.
//  Copyright © 2019 Kiran. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 0
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    @IBInspectable var thirdColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            updateView()
        }
    }
    @IBInspectable var isDiagonal: Bool = true {
        didSet {
            updateView()
        }
    }
    func updateView()
    {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor, thirdColor].map{$0.cgColor}
        if (self.isHorizontal) {
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        }else if (self.isDiagonal)
        {
            layer.startPoint = CGPoint(x: 1, y: 0)
            layer.endPoint = CGPoint (x: 0, y: 1)
        }
        else {
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint (x: 0.5, y: 1)
        }
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
}
