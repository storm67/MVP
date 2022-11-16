//
//  File.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func makeMainCoordinator(router: Routing) -> Coordinatable
}

extension CoordinatorFactoryProtocol {
    func makeMainCoordinator(router: Routing) -> Coordinatable {
        MainCoordinator(router: router)
    }

}
