//
//  MainCoordinator.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import Foundation

class MainCoordinator: BaseCoordinator {
    
    fileprivate let router: Routing
    
    init(router: Routing) {
        self.router = router
    }
    
    public func presentViewController() {
        let viewController = ViewControllerFactory.createMainScreen()
        router.setRootViewController(viewController: viewController)
    }
    
}

extension MainCoordinator: Coordinatable {
    func start() {
        presentViewController()
    }
}

