//
//  MainModel.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import Foundation

struct Child {
    var firstName: String
    var lastName: String
    
    init(firstName: String = "", lastName: String = "") {
        self.firstName = firstName
        self.lastName = lastName
    }
}

struct Section {
    var type: SectionType
    var child: [Child]?
}

enum SectionType {
    case personality
    case adder
    case remove
}
