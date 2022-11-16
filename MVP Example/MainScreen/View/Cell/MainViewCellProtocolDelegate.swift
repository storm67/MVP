//
//  MainViewCellProtocolDelegate.swift
//  MVP Example
//
//  Created by Andrey Gubin on 25.10.2022.
//

import Foundation

enum Position {
    case first
    case second
}

protocol MainInfoRedactorProtocol: AnyObject {
    func tfTextWasChanged(position: Position, indexPath: IndexPath, text: String?)
    func delete(indexPath: IndexPath)
}
