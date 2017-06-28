//
//  MenuView.swift
//  MenuExample
//
//  Created by nabinrai on 6/28/17.
//  Copyright © 2017 nabin. All rights reserved.
//

import UIKit

class AnimatingView: UIView {
    
    var tapped:Bool = true

    override func awakeFromNib() {
        super.awakeFromNib()
        viewProperties()
        addGestureToView()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewProperties()
        addGestureToView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func viewProperties(){
        self.backgroundColor = .yellow
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.purple.cgColor
        self.clipsToBounds = true
    }
    
    func animateToLarge(){
        
        UIView.animate(withDuration: 0.5, animations: {
            let scaleTransform = CGAffineTransform(scaleX: 2, y: 2)
            let rotateTransform = CGAffineTransform(rotationAngle:CGFloat(Double.pi))
            let translationTransform = CGAffineTransform(translationX: 0, y: (self.superview?.frame.size.height)!-self.center.y-self.frame.height)
            self.transform = scaleTransform.concatenating(rotateTransform).concatenating(translationTransform)
        })
        
    }
    
    func animateToIdentity(){
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = .identity
        })
        
    }
    
    func addGestureToView(){
        let panGesture = UITapGestureRecognizer(target: self, action: #selector(gestureAction))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(panGesture)
        
    }
    func gestureAction(_ panGesture: UITapGestureRecognizer){
      print("View Tapped")
        switch tapped {
        case true:
            self.animateToLarge()
            tapped = false
            break
        case false:
            self.animateToIdentity()
            tapped = true
            break

        }
    }
    
    
}

