//
//  EntityType.swift
//  algo
//
//  Created by 360medlink Tunisia on 5/28/20.
//  Copyright © 2020 360medlink Tunisia. All rights reserved.
//

import Foundation

enum EntityType : CaseIterable {
    
    case none
    case fullname
    case firstName
    case lastName
    
    case company
    
    case title
    case title2
    
    case adress1
    case adress2
    
    case country
    case city
    case state
    
    case street
    case zip
    case direct
    case phone
    
    case mobile
    case fax
    
    case email
    case website
    
   case unknown
//    static func processAsKey(value:String) -> EntityType {
//        if value.existInArray(array: NamedEntity.businessCardPrefixes) {
//            
//        }
//    }
    
}
