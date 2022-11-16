//
//  BaseCoordinator.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import Foundation

class BaseCoordinator {
    var childCoordinators: [Coordinatable] = []
}

extension BaseCoordinator {
    
    public func addDependency(_ coordinator: Coordinatable) {
        childCoordinators.forEach {
            if $0 === coordinator { return }
            childCoordinators.append(coordinator)
        }
    }
    
    public func removeDependency(_ coordinator: Coordinatable?) {
        guard !childCoordinators.isEmpty, let coordinator = coordinator else { return }
        if let firstIndex = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: firstIndex)
        }
    }
    
}
