//
//  CLImageViewPopup.swift
//  poplearning
//
//  Created by Vineeth Vijayan on 01/05/16.
//  Copyright © 2016 creativelogics. All rights reserved.
//

import UIKit

class CLImageViewPopup: UIImageView {
    var tempRect: CGRect?
    var bgView: UIView!
    
    var animated: Bool = true
    var intDuration = 0.25
    //MARK: Life cycle
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CLImageViewPopup.popUpImageToFullScreen))
        self.addGestureRecognizer(tapGesture)
        self.userInteractionEnabled = true
        //        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Actions of Gestures
    func exitFullScreen () {
        let imageV = bgView.subviews[0] as! UIImageView
        
        UIView.animateWithDuration(intDuration, animations: {
                imageV.frame = self.tempRect!
                self.bgView.alpha = 0
            }) { (bol) in
                self.bgView.removeFromSuperview()
        }
    }
    
    func popUpImageToFullScreen() {
        
        if let window = UIApplication.sharedApplication().delegate?.window {
            let parentView = self.findParentViewController(self)!.view
            
            bgView = UIView(frame: UIScreen.mainScreen().bounds)
            bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CLImageViewPopup.exitFullScreen)))
            bgView.alpha = 0
            bgView.backgroundColor = UIColor.blackColor()
            let imageV = UIImageView(image: self.image)
            let point = self.convertRect(self.bounds, toView: parentView)
            imageV.frame = point
            tempRect = point
            imageV.contentMode = .ScaleAspectFit
            self.bgView.addSubview(imageV)
            window?.addSubview(bgView)
            
            if animated {
                UIView.animateWithDuration(intDuration, animations: {
                    self.bgView.alpha = 1
                    imageV.frame = CGRectMake(0, 0, (parentView?.frame.width)!, (parentView?.frame.width)!)
                    imageV.center = (parentView?.center)!
                })
            }
        }
    }
    
    func findParentViewController(view: UIView) -> UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.nextResponder()
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
