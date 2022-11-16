//
//  HeaderViewDelegate.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import Foundation

protocol HeaderViewDelegate: AnyObject {
    func add()
}

protocol BackgroundViewHiding {
    func hide(_ cond: Bool)
    func remove()
}
