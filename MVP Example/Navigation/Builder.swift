//
//  AbstractFabric.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

final class ViewControllerFactory: BuilderProtocol {
    
    static public func createMainScreen() -> UIViewController {
        let presenter = MainPresenter()
        let mainView = MainScreenView()
        let viewController = MainViewController(presenter: presenter, mainView: mainView)
        return viewController
    }
    
}
