//
//  CellFactory.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

final class CellFactory {
    
    static func dequeueMainCell(tableView: UITableView,
                                child: Child,
                                sectionType: SectionType,
                                delegate: MainInfoRedactorProtocol,
                                indexPath: IndexPath,
                                count: Int) -> UITableViewCell {
        MainViewCell(sectionType: sectionType, delegate: delegate, child: child, indexPath: indexPath, count: count)
    }
    
    static func dequeueFooterView(delegate: FooterViewDelegate) -> UITableViewCell {
        FooterView(delegate: delegate)
    }
    
}
