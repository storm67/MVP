//
//  Router.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

final class Router {
    
    fileprivate var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension Router: Routing {
    
    func setRootViewController(viewController: UIViewController) {
        navigationController.setViewControllers([viewController], animated: true)
        navigationController.navigationBar.isHidden = true
    }
    
    func pushViewController(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func present(viewController: UIViewController) {
        navigationController.present(viewController, animated: true)
    }
    
}
