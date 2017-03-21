//
//  ViewController.swift
//  ShadesExample
//
//  Created by Tailored Tech on 21/03/17.
//  Copyright © 2017 Pravin Sankeshwari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.setNormalShadow()
//        self.setOverallShadow()
//        self.setEllipticalShadow()
//        self.setTrapezoidalShadow()
//        self.setCurlShadow()
        self.setCurvedShadow()
//        self.setAnimatedShadow()
//        self.setHoverShadow()
        
//        imageView.layer.cornerRadius = imageView.frame.size.height/2
//        self.setRoundedCornerShadow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func setNormalShadow() {
        imageView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        imageView.layer.shadowOffset = CGSize(width: 3, height: 3) //CGSizeMake(3.0, 3.0)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 3.0
    }
    
    func setOverallShadow() {
        //applying overall shadow to image
        imageView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        imageView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 6.0
    }
    
    func setTrapezoidalShadow() {
        
        let size = imageView.bounds.size
        
        //creating a trapezoidal path for shadow
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: size.width * 0.20, y: size.height * 0.80))
        path.move(to: CGPoint(x: size.width * 0.20, y: size.height * 0.80))
        path.addLine(to: CGPoint(x: size.width * 0.80, y: size.height * 0.80))
        path.addLine(to: CGPoint(x: size.width * 1.20, y: size.height * 1.20))
        path.addLine(to: CGPoint(x: size.width * -0.20, y: size.height * 1.20))
        path.close()
        
        //applying path as shadow to image
        imageView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        imageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 3.0
        imageView.layer.shadowPath = path.cgPath
    }
    
    func setEllipticalShadow() {
        
        //create elliptical shdow forimage through UIBezierPath
        let ovalRect = CGRect(x: 0.0, y: imageView.frame.size.height + 10, width: imageView.frame.size.width, height: 15)
        let path = UIBezierPath(ovalIn: ovalRect)
        
        //applying shadow to path
        imageView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        imageView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 3.0
        imageView.layer.shadowPath = path.cgPath
    }
    
    func setCurlShadow() {
        
        //create a bezier path with curl effect
        let size = imageView.frame.size
        let path = UIBezierPath()
        
        //starting from left point
        path.move(to: CGPoint(x: 0.0, y: size.height))
        path.addLine(to: CGPoint(x: 0.0, y: size.height + 20.0))
        
        //curved bottom part
        path.addCurve(to: CGPoint(x: size.width, y: size.height + 20.0), controlPoint1: CGPoint(x: 20.0, y: size.height), controlPoint2: CGPoint(x: size.width - 20.0, y: size.height))
        
        //closing the path by going upper top part
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        
        //close the path and apply the path as shadow
        path.close()
        
        //applying shadow to imageView through the path created
        imageView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        imageView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 3.0
        imageView.layer.shadowPath = path.cgPath
    }
    
    func setCurvedShadow() {
        let size = imageView.bounds.size
        let width = size.width
        let height = size.height
        let depth = CGFloat(11.0)
        let lessDepth = 0.8 * depth
        let curvyness = CGFloat(5)
        let radius = CGFloat(1)
        
        let path = UIBezierPath()
        
        // top left
        path.move(to: CGPoint(x: radius, y: height))
        
        // top right
        path.addLine(to: CGPoint(x: width - 2*radius, y: height))
        
        // bottom right + a little extra
        path.addLine(to: CGPoint(x: width - 2*radius, y: height + depth))
        
        // path to bottom left via curve
        path.addCurve(to: CGPoint(x: radius, y: height + depth),
                             controlPoint1: CGPoint(x: width - curvyness, y: height + lessDepth - curvyness),
                             controlPoint2: CGPoint(x: curvyness, y: height + lessDepth - curvyness))
        
        imageView.layer.shadowPath = path.cgPath
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowRadius = radius
        imageView.layer.shadowOffset = CGSize(width: 0, height: -3)
    }
    
    func setHoverShadow() {
        let size = imageView.bounds.size
        let width = size.width
        let height = size.height
        
        let ovalRect = CGRect(x: 5, y: height + 5, width: width - 10, height: 15)
        let path = UIBezierPath(roundedRect: ovalRect, cornerRadius: 10)
        
        imageView.layer.shadowPath = path.cgPath
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.2
        imageView.layer.shadowRadius = 5
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func setAnimatedShadow() {
        //applying the shadow
        imageView.layer.shadowColor =  UIColor(white: 0.0, alpha: 0.5).cgColor
        imageView.layer.shadowOffset = CGSize(width: 20, height: -20)
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowRadius = 2.0
        
        //applying animation to shadows
        let animation = CABasicAnimation(keyPath: "shadowOffset")
        animation.fromValue = NSValue(cgSize:CGSize(width: -20, height: -20))
        animation.toValue = NSValue(cgSize: CGSize(width: 20, height: 20))
        animation.duration = 2.0
        imageView.layer.add(animation, forKey: "shadowOffset")
    }
    
    func setRoundedCornerShadow() {
         self.putShadowOnView(viewToWorkUpon: imageView, shadowColor: UIColor(white: 0.0, alpha: 0.5), radius: 2.0, offset: CGSize(width: 0.0, height: 0.0), opacity: 0.7)
    }
    
    func putShadowOnView(viewToWorkUpon:UIView, shadowColor:UIColor, radius:CGFloat, offset:CGSize, opacity:Float){
        
        var shadowFrame = CGRect.zero // Modify this if needed
        shadowFrame.size.width = 0.0
        shadowFrame.size.height = 0.0
        shadowFrame.origin.x = 0.0
        shadowFrame.origin.y = 0.0
        
        let shadow = UIView(frame: shadowFrame)//[[UIView alloc] initWithFrame:shadowFrame];
        shadow.isUserInteractionEnabled = false; // Modify this if needed
        shadow.layer.shadowColor = shadowColor.cgColor
        shadow.layer.shadowOffset = offset
        shadow.layer.shadowRadius = radius
        shadow.layer.masksToBounds = false
        shadow.clipsToBounds = false
        shadow.layer.shadowOpacity = opacity
        viewToWorkUpon.superview?.insertSubview(shadow, belowSubview: viewToWorkUpon)
        shadow.addSubview(viewToWorkUpon)
        //return shadow
    }

}

