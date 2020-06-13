//
//  RecognizedEntity.swift
//  algo
//
//  Created by 360medlink Tunisia on 6/13/20.
//  Copyright © 2020 360medlink Tunisia. All rights reserved.
//

import Foundation

class RecognizedEntity: Codable {
    var fullName, city, companyName, companyWebsite, country, countryPrefix, email , fax, phone, direct, mobile , zip, title, alternativeTitle, street, secondAdress, state, titleSecond : String
    
    init(fullName : String, title : String, secondTitle : String, companyName : String, companyWebsite : String, city : String, state: String, country : String, countryPrefix : String, email : String, fax : String, phone : String, direct : String, mobile : String, zip : String, street : String , secondAdress: String) {
        self.fullName = fullName
        self.title = title
        self.titleSecond = secondTitle
        self.companyName = companyName
        self.companyWebsite = companyWebsite
        self.city = city
        self.state = state
        self.country = country
        self.countryPrefix = countryPrefix
        self.email = email
        self.fax = fax
        self.phone = phone
        self.direct = direct
        self.mobile = mobile
        self.zip = zip
        self.street = street
        self.secondAdress = secondAdress
    }
}
