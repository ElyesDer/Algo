//
//  EntityType.swift
//  algo
//
//  Created by 360medlink Tunisia on 5/28/20.
//  Copyright © 2020 360medlink Tunisia. All rights reserved.
//

import Foundation


enum SupportedLangage : String {
    case fra = "Frensh"
    case eng = "English"
    case spanish = "Spanish"
    case portugese = "Portugese"
    case arabic = "Arabic"
    case italian = "Italian"
}

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
    case unknownPhone
    
}



struct Prefix {
    var value = ""
    var position = -1
    var entityType : EntityType = .none
}


enum PrefixType {
    case safe
    case unsafe
}

struct PrefixHolder {
    var key : String
    var value : String
    var type : EntityType = .unknown
}

func testPrint<T>(tag : String, title : String, content : T){
    //print("------------------------ \(tag) - \(title) ---------------------------\n")
    
    print("\n\(tag) - \(title)  : > \(content) \n")
    
    //print("\n------------------------ END \(title) --------------------------- \n\n")
}




struct CountryZip {
    let countryPrefix : String
    let zipREX : String
}


struct CountryPhonePrefix : Codable {
    
    let countryPrefix : String
    let createdAt : String?
    let id : Int?
    let languageCode : String?
    let countryName : String
    var phonePrefix : String
    let status : String
    let zipREX : String
    
    enum CodingKeys: String, CodingKey {
        case countryPrefix = "country_prefix"
        case createdAt = "createdAt"
        case id = "id"
        case languageCode = "languageCode"
        case countryName = "name"
        case phonePrefix = "phone_prefix"
        case status = "status"
        case zipREX = "zip_regular_expression"
    }
    
    
    init (countryPrefix: String, phonePrefix: String, countryName: String, zipREX: String){
        self.countryPrefix = countryPrefix
        self.phonePrefix = phonePrefix.trimmedAndLowercased
        self.countryName = countryName.trimmedAndLowercased
        self.zipREX = zipREX
        self.status = ""
        self.createdAt = ""
        self.id = 0
        self.languageCode = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        countryPrefix = try values.decodeIfPresent(String.self, forKey: .countryPrefix) ?? ""
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)?.trimmedAndLowercased
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        languageCode = try values.decodeIfPresent(String.self, forKey: .languageCode)?.trimmedAndLowercased
        countryName = try values.decodeIfPresent(String.self, forKey: .countryName)?.trimmedAndLowercased ?? ""
        phonePrefix = try (values.decodeIfPresent(String.self, forKey: .phonePrefix)?.isEmpty ?? true ? "NULL" : values.decodeIfPresent(String.self, forKey: .phonePrefix)) ?? "NULL"
        status = try values.decodeIfPresent(String.self, forKey: .status) ?? ""
        zipREX = try values.decodeIfPresent(String.self, forKey: .zipREX)?.replacingOccurrences(of: "\\\\", with: "\\") ?? ""
    }
    
}


class CountriesWithCities : Codable{
    var id : Int
    var name : String
    var country_prefix : String
    
    init (id : Int, name : String, country_prefix : String){
        self.id = id
        self.name = name
        self.country_prefix = country_prefix
    }
}



/// State
struct StatesWithPrefixSuccess : Codable {
    let success : StatesWithPrefix
}
struct StatesWithPrefix : Codable{
    let statusCode : Int
    let message : String
    let data : [CountriesWithCities]
}

///Phone prefixes
struct PhonePrefixSuccess : Codable {
    let success : PhonePrefix
}
struct PhonePrefix : Codable{
    let statusCode : Int
    let message : String
    let data : [PhonePrefixes]
}

struct PhonePrefixes : Codable {
    let id : Int
    let key : String
    let value : String
    let type : String
}


struct CitiesWithPrefixSuccess : Codable {
    let success : CitiesWithPrefix
}
struct CitiesWithPrefix : Codable{
    let statusCode : Int
    let message : String
    let data : [CountriesWithCities]
}

struct CountriesSuccess : Decodable {
    let success : CountriesResponse
}
struct CountriesResponse : Decodable {
    let statusCode : Int
    let message : String
    let data : [Countries]
}
struct Countries : Decodable {
    let id : Int
    let name : String
    let country_prefix : String
    let phone_prefix : String
    let zip_regular_expression : String?
    
}
struct titlesPMSuccess : Codable {
    let success : titlesPMResponse
}
struct titlesPMResponse : Codable {
    let statusCode : Int
    let message : String
    let data : [titlesPM]
}
struct titlesPM : Codable {
    let id : Int
    let title_name : String
    let createdAt : String
    
    init() {
        id = 0
        title_name = ""
        createdAt = ""
    }
}


struct Response<V: Codable>: Codable {
    let success: NestedResponse<V>
}

struct NestedResponse<T: Codable>: Codable {
    let statusCode: Int?
    let message, code: String?
    let data: T?
    
}
