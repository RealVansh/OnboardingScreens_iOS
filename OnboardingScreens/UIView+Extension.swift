//
//  UIView+Extension.swift
//  OnboardingScreens
//
//  Created by admin100 on 19/12/24.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return cornerRadius}
        set {self.layer.cornerRadius = newValue}
    }
}
