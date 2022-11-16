//
//  AppCoordinator.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import Foundation


fileprivate enum State {
    case main
        
    static func setup() -> State {
        return .main
    }
}

final class AppCoordinator: BaseCoordinator {
        
    fileprivate let coordinatorFactory: CoordinatorFactoryProtocol
    fileprivate let router: Router
    
    fileprivate var state: State {
        State.setup()
    }
    
    init(factory: CoordinatorFactoryProtocol, router: Router) {
        self.coordinatorFactory = factory
        self.router = router
    }
    
}

extension AppCoordinator: Coordinatable {
    
    func start() {
        switch state {
        case .main:
            presentMainScreen()
        }
    }
    
}

extension AppCoordinator {
    
    func presentMainScreen() {
        let coordinator = coordinatorFactory.makeMainCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }
    
}
