//
//  Builder.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

protocol BuilderProtocol {
    static func createMainScreen() -> UIViewController
}

protocol MainNavigationProtocol {
    func presentViewController()
}
