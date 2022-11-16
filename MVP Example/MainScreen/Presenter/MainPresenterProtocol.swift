//
//  MainPresenterProtocol.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import Foundation

protocol MainPresenterProtocol {
    func deleteUser(withIndex index: Int, _ block: () -> Void)
    func countOfRows(section: Int) -> Int
    func sectionCount() -> Int
    func element(index: Int) -> Child
    func removeAll(_ block: () -> Void)
    func add(_ block: () -> Void)
    func getSectionType(index: Int) -> SectionType
    func change(indexPath: IndexPath, position: Position, text: String?)
    func max() -> Bool
}
