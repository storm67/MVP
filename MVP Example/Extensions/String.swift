//
//  String.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        .init(describing: self)
    }
}
