//
//  Presenter.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    fileprivate(set) var sections: [Section] = [.init(type: .personality, child: [Child()]),
                                                .init(type: .adder, child: [Child()]),
                                                .init(type: .remove, child: [Child()])]
    
    fileprivate(set) var maximum = false
    
    public func deleteUser(withIndex index: Int, _ block: () -> Void) {
        sections[1].child?.remove(at: index)
        if sections[1].child?.isEmpty ?? true {
            sections.remove(at: 2)
        }
        block()
    }
    
    public func countOfRows(section: Int) -> Int {
        sections[section].child?.count ?? .zero
    }
    
    public func sectionCount() -> Int {
        sections.count
    }
    
    public func element(index: Int) -> Child {
        if let childs = sections[1].child, !childs.isEmpty {
            return childs[index]
        } else {
            return .init()
        }
    }
    
    public func removeAll(_ block: () -> Void) {
        sections[1].child?.removeAll()
        sections.remove(at: 2)
        block()
    }
    
    public func add(_ block: () -> Void) {
        let child = Child()
        guard let childs = sections[1].child, childs.count <= 5 else { return }
        sections[1].child?.append(child)
        if let childs = sections[1].child, childs.count == 5 {
            maximum = true
        } else if sections.count < 3 {
            sections.append(.init(type: .remove, child: [Child()]))
        }
        block()
    }
    
    public func getSectionType(index: Int) -> SectionType {
        sections[index].type
    }
    
    public func change(indexPath: IndexPath, position: Position, text: String?) {
        switch position {
        case .first:
            sections[indexPath.section].child?[indexPath.row].firstName = text ?? ""
        case .second:
            sections[indexPath.section].child?[indexPath.row].lastName = text ?? ""
        }
    }
    
    public func max() -> Bool {
        maximum
    }
    
}
