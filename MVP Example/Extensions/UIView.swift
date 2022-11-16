//
//  UIView.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            if !subviews.contains(view) {
                addSubview(view)
            }
        }
    }
    
}
