//
//  ViewController.swift
//  Chart
//
//  Created by alexfu on 5/18/16.
//  Copyright © 2016 alexfu. All rights reserved.
//
import UIKit


extension UIView {
    var posPoint:CGPoint {
        get  {
         return CGPointMake(CGRectGetWidth(self.bounds) / 3.0, CGRectGetHeight(self.bounds) / 2.0)
        }
    }
    
}


class ViewController :UIViewController{

     
    @IBOutlet weak var contentView: UIView!
        // Scale value.
        var scale: CGFloat = 0.8
        let CGFLOAT_MAX: Float = 100.0
        
        override func viewDidLoad() {
            
            setup()
            
            
        }
        
    
        func setup() {
            
            self.view.backgroundColor = UIColor.blackColor()
                // Used as background.
            
                    let LineLayer: CAShapeLayer = CAShapeLayer()
                    LineLayer.frame = CGRectMake(0, 0, 600, 300)
                    LineLayer.path = self.path().CGPath
                    LineLayer.fillColor = UIColor.clearColor().CGColor
                    LineLayer.strokeColor = UIColor.whiteColor().CGColor
                    LineLayer.lineWidth = 0.5
                    LineLayer.opacity = 0.5
                    LineLayer.position = self.contentView.posPoint
                    LineLayer.transform = CATransform3DMakeScale(scale, scale, 1.0)
                    self.contentView.layer.addSublayer(LineLayer)
            contentView.backgroundColor = UIColor.blackColor()
            // Red line animation.
            
                let shapeLayer: CAShapeLayer = CAShapeLayer()
                shapeLayer.frame = CGRectMake(0, 0, 600, 300)
                shapeLayer.path = self.path().CGPath
                shapeLayer.strokeEnd = 0.0
                shapeLayer.fillColor = UIColor.clearColor().CGColor
                shapeLayer.strokeColor = UIColor.redColor().CGColor
                shapeLayer.lineWidth = 2.0
                shapeLayer.position = self.contentView.posPoint
                shapeLayer.shadowColor = UIColor.redColor().CGColor
                shapeLayer.shadowOpacity = 1.0
                shapeLayer.shadowRadius = 4.0
                shapeLayer.lineCap = kCALineCapRound
                shapeLayer.transform = CATransform3DMakeScale(scale, scale, 1.0)
                self.contentView.layer.addSublayer(shapeLayer)
                let max: CGFloat = 0.98
                let GAP: CGFloat = 0.2
                let aniStart: CABasicAnimation = CABasicAnimation(keyPath: "strokeStart")
                aniStart.fromValue = 0.0
                aniStart.toValue = max
                let aniEnd: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
                aniEnd.fromValue = 0.0 + GAP
                aniEnd.toValue = max + GAP
                let group: CAAnimationGroup = CAAnimationGroup()
                group.duration = 4.0
                group.repeatCount = CGFLOAT_MAX
           //     group.autoreverses = true
                group.animations = [ aniEnd,aniStart]
                shapeLayer.addAnimation(group, forKey: nil)
            
            
            

            
            
        }
        
        
    
    func path() -> UIBezierPath {
        let  bezierPath: UIBezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(0, 150))
        bezierPath.addLineToPoint(CGPointMake(68, 150))
        bezierPath.addLineToPoint(CGPointMake(83, 107))
        bezierPath.addLineToPoint(CGPointMake(96, 206))
        bezierPath.addLineToPoint(CGPointMake(102, 150))
        bezierPath.addLineToPoint(CGPointMake(116, 150))
        bezierPath.addLineToPoint(CGPointMake(127, 82))
        bezierPath.addLineToPoint(CGPointMake(143, 213))
        bezierPath.addLineToPoint(CGPointMake(160, 150))
        bezierPath.addLineToPoint(CGPointMake(179, 150))
        bezierPath.addLineToPoint(CGPointMake(183, 135))
        bezierPath.addLineToPoint(CGPointMake(192, 169))
        bezierPath.addLineToPoint(CGPointMake(199, 150))
        bezierPath.addLineToPoint(CGPointMake(210, 177))
        bezierPath.addLineToPoint(CGPointMake(227, 70))
        bezierPath.addLineToPoint(CGPointMake(230, 210))
        bezierPath.addLineToPoint(CGPointMake(249, 135))
        bezierPath.addLineToPoint(CGPointMake(257, 150))
        bezierPath.addLineToPoint(CGPointMake(360, 150))
        bezierPath.addLineToPoint(CGPointMake(372, 124))
        bezierPath.addLineToPoint(CGPointMake(395, 197))
        bezierPath.addLineToPoint(CGPointMake(408, 82))
        bezierPath.addLineToPoint(CGPointMake(416, 150))
        bezierPath.addLineToPoint(CGPointMake(424, 135))
        bezierPath.addLineToPoint(CGPointMake(448, 224))
        bezierPath.addLineToPoint(CGPointMake(456, 107))
        bezierPath.addLineToPoint(CGPointMake(463, 150))
        bezierPath.addLineToPoint(CGPointMake(600, 150))
        return bezierPath
    }
}
