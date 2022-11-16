//
//  RouterProtocol.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

protocol Routing {
    func setRootViewController(viewController: UIViewController)
    func pushViewController(viewController: UIViewController)
    func present(viewController: UIViewController)
}
