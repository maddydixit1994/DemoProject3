//
//  DesignableUIVIew.swift
//  DemoProject2
//
//  Created by Revonomics on 15/10/18.
//  Copyright © 2018 Revonomics. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableUIView: UIView {
    
    private static let kRotationAnimationKey = "rotationanimationkey"
    var rotationAnimation:CABasicAnimation? = nil
    
    // set border color
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    // set border width
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    // set border corner radius
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    // set shadow opacity
    @IBInspectable public var shadowOpacity: CGFloat = 0.0 {
        didSet {
            self.layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    // set shadow color
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    // set border corner radius
    @IBInspectable public var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    // set border corner radius
    @IBInspectable public var shadowOffSetX: CGFloat = 0.0 {
        didSet {
            self.layer.shadowOffset.width = shadowOffSetX
        }
    }
    
    // set border corner radius
    @IBInspectable public var shadowOffSetY: CGFloat = 0.0 {
        didSet {
            self.layer.shadowOffset.height = shadowOffSetY
        }
    }
    
    func rotate(duration: Double) {
        if layer.animation(forKey: DesignableUIView.kRotationAnimationKey) == nil {
            rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation?.fromValue = 0.0
            rotationAnimation?.toValue = Float.pi * 2.0
            rotationAnimation?.duration = duration
            rotationAnimation?.repeatCount = Float.infinity
            
            layer.add(rotationAnimation!, forKey: DesignableUIView.kRotationAnimationKey)
        }
    }
    
    func updateSpeed(speed: Double) {
        if layer.animation(forKey: DesignableUIView.kRotationAnimationKey) != nil {
            print("Speed Set : ",speed)
            rotationAnimation?.duration = speed
            layer.removeAnimation(forKey: DesignableUIView.kRotationAnimationKey)
            layer.add(rotationAnimation!, forKey: DesignableUIView.kRotationAnimationKey)
        }
    }
    
    func stopRotating() {
        if layer.animation(forKey: DesignableUIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: DesignableUIView.kRotationAnimationKey)
            rotationAnimation = nil
        }
    }
}


