//
//  AlertFactory.swift
//  MVP Example
//
//  Created by Andrey Gubin on 25.10.2022.
//

import UIKit

class AlertFactory {
    
    static func createAlertController(compl: @escaping () -> Void) -> UIAlertController {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let saveAction = UIAlertAction(title: "Сбросить данные", style: .destructive, handler: {
                (alert: UIAlertAction!) -> Void in
            compl()
        })
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        return optionMenu
    }
    
}
