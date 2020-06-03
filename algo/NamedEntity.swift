//
//  File.swift
//  algo
//
//  Created by 360medlink Tunisia on 5/28/20.
//  Copyright © 2020 360medlink Tunisia. All rights reserved.
//

import Foundation


class PhoneNumberNamedEntity: NamedEntity {
    var phoneNumber : PhoneNumber?
}


class AddressNamedEntity: NamedEntity {
    var city : String = ""
    var state : String = ""
    var zip : String = ""
    var country :String = ""
    var street : String = ""
    var adress_second : String = ""
    var latitude : String = ""
    var longitude : String = ""
    
    
    var site_zip : String = ""
    
    var country_prefix : String = ""
    
    public func toString() -> String{
        
        return "street : \(street) \n address-Second : \(adress_second) \n city : \(city) \n State : \(state)  \n Zip : \(zip)  \n Coundtry \(country)"
        
    }
    
    
}

class NamedEntity {
    var value : String = ""
    var type : EntityType = .none
    var score = 0
    
    var position : Int = 0
    
    
    var validatedPhones : [PhoneNumber] = []
    var inValidatedPhones : [PhoneNumber] = []
    
    init(value : String) {
        self.value = value
    }
    
    init(value : String, type : EntityType) {
        self.value = value
        self.type = type
    }
    
    init(value : String, type : EntityType, position : Int) {
        self.value = value
        self.type = type
        self.position = position
    }
    
    
    func computeWebsite(namedEntityHolder : [ NamedEntity ] , prefixes : [PrefixHolder] ) -> [NamedEntity] {
        
        var holder : [NamedEntity] = []
        
        var matches = value.matchingStrings(regex: RecognitionTools.websiteRegex)
        matches.forEach { (item) in
            item.forEach { (subItem) in
                if(subItem.count > 3 && !subItem.existInArray(array: holder.map({$0.value}),level: 0.98)){
                    holder.append(NamedEntity(value: subItem, type: .website) )
                }
                
            }
        }
        
        return holder
    }
    
    // is array because one line can contain multiple emails
    func computeEmails(namedEntityHolder : [ NamedEntity ] , prefixes : [PrefixHolder] ) -> [NamedEntity] {
        
        var holder : [NamedEntity] = []
        
        
        var matches = value.matchingStrings(regex: RecognitionTools.emailRegex)
        matches.forEach { (item) in
            item.forEach { (subItem) in
                if subItem.isValidEmail() {
                    holder.append(NamedEntity(value: subItem, type: .email) )
                }
            }
        }
        
        return holder
    }
    
    func computeFullName( namedEntityHolder : [ NamedEntity ] ) -> NamedEntity {
        //resultHolder[value] = score
        
        // extract email and website
        let emails = namedEntityHolder.filter { (namedEntity) -> Bool in
            namedEntity.type == .email
        }
        
        let websites = namedEntityHolder.filter { (namedEntity) -> Bool in
            namedEntity.type == .website
        }
        
        var tokensValue = value.components(separatedBy: " ")
        
        
        // remove white space so it detects correctly
        if  value.replacingOccurrences(of: " ", with: "").description.isAllNumber {
            self.score -= 100
            return self
        }
        
        if !value.lengthBetween(l1: 3, l2: 35) {
            self.score -= 100
            return self
        }
        
        
        
        if value.existInArray(array: namedEntityHolder.map({$0.value}),level: 0.9 ) {
            self.score -= 100
            return self
            /*
             Replaces :
             let result = namedEntityHolder.filter { (dkey, dvalue) in
             dvalue.value.existIn(container: self.value, caseSensitive: false, level: 1)
             }
             // already found in array, so we close and return
             if result.count > 0 {
             return self
             }
             */
        }
        
        // this needs prefix to be removed
        if 2...5 ~= tokensValue.count {
            //print("2...3 ~= tokensValue.count")
            //score += 10
        } else {
            self.score -= 100
            return self
        }
        
        
        var notValid = false
        tokensValue.forEach { (token) in
            if token.count < 2 {
                notValid = true
            }
        }
        
        if notValid {
            self.score -= 100
            return self
        }
        
        // todo : check if email , is valid ...
        if value.isValidEmail() {
            self.score -= 100
            return self
        }
        
        if value.containsNumbers() {
            score -= 30
        }
        
        var containsNamePrefixes = false
        while RecognitionTools.lowerCaseNamesPrefixes.contains(tokensValue.first?.trimmedAndLowercased ?? "") {
            containsNamePrefixes.toggle()
            tokensValue.removeFirst()
        }
        // TODO : DONE need to check for DR. PROF. and remove them from string
        if containsNamePrefixes {
            value = tokensValue.joined(separator: " ")
            score += 30
        }
        
        
        
        for (index,element) in tokensValue.enumerated() {
            if element.containsNumbers() {
                score -= 10
            }
            if index < 1 {
                // first element
                if element.beginsWithUpperCase(){
                    score += 10
                }else{
                    score -= 20
                }
            }else {
                // rest of element
                if element.isAllUpperCase(){
                    score += 5
                } else if element.beginsWithUpperCase(){
                    score += 2
                } else {
                    score -= 5
                }
            }
            
            if element.trimmedAndLowercased.existInArray(array: RecognitionTools.lowerCasejobTitles, level: 0.85)  {
                score -= 40
            }
            
            if element.existInArray(array: emails.map({$0.value.components(separatedBy: "@")[0] }), preprocess: true , level: 0.8) {
                score += 20
            }
            
            
            // po "www.em-strasbourg.eu".contains("strasbourg") does respond with true , but exist in array return false
            if element.existInArray(array: websites.map({$0.value}), preprocess: true , level: 0.8) {
                score -= 10
            }
            
        }
        
 
        
        // if it exists in first part only THAN BIGGER SCORE FOR FULL NAME else BIGGER SCORE FOR COMPANY
        
        if value.existInArray(array: emails.map({$0.value.components(separatedBy: "@")[0] }), preprocess: true , level: 0.8) {
            score += 30
        }
        
        // GO EVEN DEEPER, anc substring THE VALUE ( in case of Full name ) and test it with first part of email
        
        if value.existInArray(array: emails.map({$0.value.components(separatedBy: "@")[1] }), preprocess: true , level: 0.8) {
            score -= 10
        }
        
        if value.existInArray(array: websites.map({$0.value}), preprocess: true , level: 0.7){
            score -= 20
        }
        
        
        
        value.forEach { (char) in
            if RecognitionTools.removableNamesSpecial.contains(char.description){
                score -= 20
            }
        }
        
        
        
        return self
        
    }
    
    func computeCompany(namedEntityHolder : [ NamedEntity ] ) -> NamedEntity {
        
        // extract email and website
        let emails = namedEntityHolder.filter { (namedEntity) -> Bool in
            namedEntity.type == .email
        }
        
        let websites = namedEntityHolder.filter { (namedEntity) -> Bool in
            namedEntity.type == .website
        }
        
        let tokensValue = value.components(separatedBy: " ")
        
        if value.count < 2 {
            return self
        }
        
        // remove white space so it detects correctly
        if  value.replacingOccurrences(of: " ", with: "").description.isAllNumber {
            return self
        }
        
        if value.existInArray(array: namedEntityHolder.map({$0.value}),preprocess: true) {
            // website , email  , less Full name , are accurate so
            self.score -= 10
        }
        
        //testPrint(tag: "Company email compare", title: "\(value) exists in \(emails.map({$0.value.components(separatedBy: "@")[1] }))", content: value.existInArray(array: emails.map({$0.value.components(separatedBy: "@")[1] }), preprocess: true , level: 0.75) )
        
        if value.existInArray(array: emails.map({$0.value.components(separatedBy: "@")[1] }), preprocess: true , level: 0.74) {
            score += 40
        }
        
        //testPrint(tag: "Company websites compare", title: "\(value) exists in \(websites.map({$0.value }))", content: value.existInArray(array: websites.map({$0.value}), preprocess: true , level: 0.8) )
        
        if value.existInArray(array: websites.map({$0.value}), preprocess: true , level: 0.8) {
            score += 40
        }
        
        if tokensValue.count > 1 {
            tokensValue.forEach({ (item) in
                
                if item.isValidEmail() {
                    score -= 100
                }
                
                if item.existInArray(array: emails.map({$0.value.components(separatedBy: "@")[0] }), preprocess: true , level: 0.8) {
                    score += 5
                }
                
                // SECOND PART OF EMAIL WHERE WE GENERALLY FOUND COMPANY , SO HIGHER SCORE GOES HERE
                if item.existInArray(array: emails.map({$0.value.components(separatedBy: "@")[1] }), preprocess: true , level: 0.8) {
                    score += 20
                }
                
                
                // website is hard to do "Contains" ; so adjust the level for the best results
                if item.existInArray(array: websites.map({$0.value}), preprocess: false , level: 0.7) {
                    score += 20
                }
                
            })
        }
        
        
        if value.isAllUpperCase(){
            score += 20
        }else if value.beginsWithUpperCase() {
            score += 10
        }else {
            score -= 30
        }
        
        
        if tokensValue.count == 1 {
            score += 20
        } else if 2...4 ~= tokensValue.count{
            score += 10
        }else{
            score -= 10
        }
        
        if value.isPhoneNumber {
            score -= 20
        }
        
        // TODO : EXIST IN PREMADE DATA
        
        
        
        
        
        return self
    }
    
    
    func computeCompanyFromWebsiteOrEmail(namedEntityHolder : [ NamedEntity ]) -> [NamedEntity] {
        
        // extract email and website
        let emails = namedEntityHolder.filter { (namedEntity) -> Bool in
            namedEntity.type == .email
        }
        
        let websites = namedEntityHolder.filter { (namedEntity) -> Bool in
            namedEntity.type == .website
        }
        
        var results : [NamedEntity] = []
        
        emails.forEach { (emailEntity) in
            let partTwo = emailEntity.value.components(separatedBy: "@")[1]
            
            if !partTwo.existInArray(array: RecognitionTools.emailsDomains,preprocess: true) {
                // pretend its company website
                let found = NamedEntity(value: partTwo.components(separatedBy: ".")[0], type: .website)
                found.score = 35
                results.append( found )
                
            }
        }
        
        // lets try with website
        websites.forEach { (webEntity) in

            // replace ALL OCCURENCE OF HTTP:// HTTPS:// WWW. FTP://, .com , .fr ,.be , ......
            
            let urlString = webEntity.value
            let url = URL(string: urlString)
            if let host = url?.host {
                let found = NamedEntity(value: host.components(separatedBy: ".")[0], type: .website)
                found.score = 45
                results.append(found)
                //                if host.contains(".") {
                //
                //                }
            }
        }
        // company name have vbeen extracted from email or website , so po them
        return results
    }
    
    func computeTitle( namedEntityHolder : [ NamedEntity ])-> NamedEntity{
        
        
        let fullNamePosition : Int = namedEntityHolder.first(where: {$0.type == .fullname})?.position ?? -1
        
        
        
        let tokensValue = value.components(separatedBy: " ")
        
        if value.count < 2 {
            return self
        }
        
        // remove white space so it detects correctly
        if  value.replacingOccurrences(of: " ", with: "").description.isAllNumber {
            return self
        }
        
        if value.existInArray(array: namedEntityHolder.map({$0.value}),preprocess: true) {
            return self
        }
        
        // todo : check if email , is valid ...
        if value.isValidEmail() {
            return self
        }
        
        switch tokensValue.count {
        case let val where val > 3 : score -= 5
        case 2: score += 15
        case 1 : score += 10
        default:
            break
        }
        
        if value.containsNumbers() {
            score -= 30
        }
        
        var equalUpperCases = false
        for (index,element) in tokensValue.enumerated() {
            if index < 1 {
                // first element
                if element.beginsWithUpperCase(){
                    score += 10
                }else{
                    score -= 20
                }
                
                equalUpperCases = value.isAllUpperCase()
                
            }else {
                // rest of element
                
                if equalUpperCases != element.isAllUpperCase() {
                    score -= 10
                }
                
                if element.isAllUpperCase(){
                    score += 5
                } else if element.beginsWithUpperCase(){
                    score += 2
                }
                // second part can be lower case
            }
            
            if RecognitionTools.lowerCasejobTitles.contains(element.trimmedAndLowercased)  {
                score += 40
            }
            
//            if RecognitionTools.businessCardPrefixes.flatMap({$0}).contains(where: {$0 == element.trimmedAndLowercased}){
//
//            }
            if element.existInArray(array: RecognitionTools.businessCardPrefixes.flatMap({$0}),preprocess: false,level: 0.85){
                score -= 20
            }
            
            if element.isAllNumber {
                score -= 5
            }
            
            
        }
        
        let upperBound = score >= 50 ? 2 : 1
        
        
        
        if fullNamePosition != -1 && 1...upperBound ~= abs(position-fullNamePosition)  {
            score += 20
        }
 
//        if abs(position-fullNamePosition) == 1 {
//            score += 20
//        }
        
        
        return self
    }
    
    /// AT THIS Stage : Title, Company , FullName, Email, Website, should have been removed from RAW and not process again
    func computePhoneNumber(namedEntityHolder : [ NamedEntity] , prefixes : [PrefixHolder] , phoneNumberKit : PhoneNumberKit) -> [NamedEntity] {
        
        //        var validatedPhones : [PhoneNumber] = []
        //        var invalidatedPotentialPhones : [PhoneNumber] = []
        
        var resultHolder : [NamedEntity] = []
        
        
        if value.count < 4 {
            self.score = -100
            return []
        }
        
        if !value.containsNumbers() {
            self.score = -100
            return []
        }
        
        
        // FROM https://zapier.com/blog/extract-links-email-phone-regex/
        
        // more robust extraction between special chars : (?:(?:\+?([1-9]|[0-9][0-9]|[0-9][0-9][0-9])\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([0-9][1-9]|[0-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?
        var matches = value.matchingStrings(regex: RecognitionTools.numberPhoneRegexFromString)
        matches.forEach { (arrayOfString) in
            print("Validating \(arrayOfString)")
            if arrayOfString[0].count > 2 {
                do {
                    let phoneNumber = try phoneNumberKit.parse(arrayOfString[0])
                    validatedPhones.append(phoneNumber)
                } catch {
                    inValidatedPhones.append(PhoneNumber(numberString: arrayOfString[0], countryCode: 0, leadingZero: false, nationalNumber: 0, numberExtension: nil, type: .notParsed, regionID: nil))
                }
            }
        }
        
        
        matches = value.matchingStrings(regex: RecognitionTools.numberPhoneRegexFromStringComplex)
        
        matches.forEach { (arrayOfString) in
            arrayOfString.forEach { (item) in
                if !validatedPhones.contains(where: { (phoneNumber) -> Bool in
                    phoneNumber.numberString == item
                }) {
                    print("Second Validating \(item)")
                    if item.count > 2 {
                        do {
                            let phoneNumber = try phoneNumberKit.parse(item)
                            validatedPhones.append(phoneNumber)
                        } catch {
                            inValidatedPhones.append(PhoneNumber(numberString: item, countryCode: 0, leadingZero: false, nationalNumber: 0, numberExtension: nil, type: .notParsed, regionID: nil))
                        }
                    }
                }
            }
        }
        
        
        
        if value.preprocess.isPhoneNumber && !value.existInArray(array: validatedPhones.map({$0.numberString})) {
            // we found a potential phone composed of 12398 + ()
            //inValidatedPhones.append(value)
            
            do {
                let phoneNumber = try phoneNumberKit.parse(value)
                validatedPhones.append(phoneNumber)
            } catch {
                inValidatedPhones.append(PhoneNumber(numberString: value, countryCode: 0, leadingZero: false, nationalNumber: 0, numberExtension: nil, type: .notParsed, regionID: nil))
            }
        }
        
        
        
        // NOW THAT I GOT SOME GOOD and MAYBE BAD NUMBERS .. Process phone to get their types
        
        validatedPhones.forEach { (phoneNumber) in
            
            let phoneEntity : NamedEntity = NamedEntity(value: phoneNumber.numberString, type: .phone, position: self.position)
            
            // Wrong version
//            if let foundInPrefix = prefixes.first(where: { (prefixHolder) -> Bool in
//                phoneNumber.numberString.existIn(container: prefixHolder.value)
//            })
            
            if let foundInPrefix = prefixes.filter({ (prefixHolder) -> Bool in
                //                phoneNumber.numberString.existIn(container: prefixHolder.value, preprocess: true)
                phoneNumber.numberString.stringEqual(container: prefixHolder.value, preprocess: true)
            }).first{
                // lets guess the phone type with our enum entity type
                
                //                let entityTypeStrings = EntityType.allCases.map($0.)
                //
                //                foundInPrefix.key.existInArray(array: )
                
                // if PhoneNumberKit , is correctly validated , with a known type , take it , else
                // do some process
                
                if foundInPrefix.key.existInArray(array: RecognitionTools.directPrefixes , preprocess: true, level: 0.8) {
                    phoneEntity.type = .direct
                }else if foundInPrefix.key.existInArray(array: RecognitionTools.phonePrefixes , preprocess: true, level: 0.8) {
                    phoneEntity.type = .phone
                }else if foundInPrefix.key.existInArray(array: RecognitionTools.faxPrefixes , preprocess: true, level: 0.8) {
                    phoneEntity.type = .fax
                }else if foundInPrefix.key.existInArray(array: RecognitionTools.mobilePrefixes , preprocess: true, level: 0.8) {
                    phoneEntity.type = .mobile
                }else {
                    phoneEntity.type = .mobile
                }
                
                
            }else{
                // lets juste pick wat phoneKit suggests us
                
                switch phoneNumber.type {
                case .fixedLine:
                    phoneEntity.type = .direct
                case .mobile:
                    phoneEntity.type = .mobile
                case .fixedOrMobile :
                    phoneEntity.type = .phone
                default:
                    phoneEntity.type = .direct
                }
                
            }
            
            resultHolder.append(phoneEntity)
        }
        
        inValidatedPhones.forEach { (invalidatedPhone) in
            let phoneEntity : NamedEntity = NamedEntity(value: invalidatedPhone.numberString, type: .phone, position: self.position)
            
            
            if let foundInPrefix = prefixes.filter({ (prefixHolder) -> Bool in
                invalidatedPhone.numberString.stringEqual(container: prefixHolder.value, preprocess: true)
            }).first{
            
//            if let foundInPrefix = prefixes.first(where: { (prefixHolder) -> Bool in
//                invalidatedPhone.numberString.existIn(container: prefixHolder.value, preprocess: true, level: 0.8) // found this malformed phone in extracted prefixes
//            }) {
                if foundInPrefix.key.existInArray(array: RecognitionTools.directPrefixes) {
                    phoneEntity.type = .direct
                }else if foundInPrefix.key.existInArray(array: RecognitionTools.phonePrefixes) {
                    phoneEntity.type = .phone
                }else if foundInPrefix.key.existInArray(array: RecognitionTools.faxPrefixes) {
                    phoneEntity.type = .fax
                }else if foundInPrefix.key.existInArray(array: RecognitionTools.mobilePrefixes) {
                    phoneEntity.type = .mobile
                }else {
                    phoneEntity.type = .unknown
                }
                
                resultHolder.append(phoneEntity)
            }else{
                phoneEntity.type = .mobile
            }
        }
        
        // One row can contain multiple , so we may need to return ARRAY of [NamedEntity]
        
        // Potential phones not validated by phoneKit
        
        // lets keep tryin extracting missing numbers.. MAYBE
        
        return resultHolder
    }
    
    
}


extension String {
    
    /// Level 1 Seems a bit comfusin and no detecting exact match soo .. avoid
    
    func existInArray (array : [String] , preprocess : Bool = true , level : Double = 0.8) -> Bool {
        
        var preprocessed = self
        
        
        if preprocess {
            preprocessed = preprocessed.trimmedAndLowercased
            preprocessed = preprocessed.replacingOccurrences(of: " ", with: "")
            preprocessed = preprocessed.replacingOccurrences(of: preprocessed.filter({RecognitionTools.removeableChars.contains($0)}), with: "")
        }
        
        
        return array.filter { (element) -> Bool in
            element
                .trimmedAndLowercased
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: preprocessed.filter({RecognitionTools.removeableChars.contains($0)}), with: "")
                .distanceJaroWinkler(between: preprocessed) >= level
        }.count > 0
    }
    
    func existInDictionnary(dictionnary : [EntityType : NamedEntity ], level : Double = 0.9) -> Bool {
        let result = dictionnary.filter { (dkey, dvalue) in
            dvalue.value.existIn(container: self, preprocess: true, level: level)
        }
        // already found in array, so we close and return
        if result.count > 0 {
            return true
        }else{
            return false
        }
    }
    
    var isCNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    var isAllNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    func lengthBetween(l1 : Int , l2: Int) -> Bool {
        if self.count >= l1 && self.count <= l2 {
            return true
        }else{
            return false
        }
    }
    
    func isUppercased(at: Index) -> Bool {
        
        if self.count < 1 {
            return false
        }
        
        let range = at..<self.index(after: at)
        return self.rangeOfCharacter(from: .uppercaseLetters, options: [], range: range) != nil
    }
    
    func isLowercased(at: Index) -> Bool {
        
        if self.count < 1 {
            return false
        }
        
        let range = at..<self.index(after: at)
        return self.rangeOfCharacter(from: .lowercaseLetters, options: [], range: range) != nil
    }
    
    func containsNumbers() -> Bool {
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = self.rangeOfCharacter(from: decimalCharacters)
        
        if decimalRange != nil {
            return true
        }else{
            return false
        }
    }
    
    func beginsWithUpperCase() -> Bool {
        if isUppercased(at: self.startIndex){
            return true
        }else{
            return false
        }
    }
    
    func isAllUpperCase() -> Bool {
        let lowercases = self.filter({ $0.isLowercase })
        
        if lowercases.count > 0 {
            return false
        }else{
            return true
        }
    }
    
    func existIn(container: String, preprocess: Bool , level: Double = 0.9) -> Bool {
        
        var preprocessed = self
        
        
        if preprocess {
            preprocessed = preprocessed.trimmedAndLowercased
            preprocessed = preprocessed.replacingOccurrences(of: " ", with: "")
            preprocessed = preprocessed.replacingOccurrences(of: preprocessed.filter({RecognitionTools.removeableChars.contains($0)}), with: "")
        }
        
        if preprocessed.distanceJaroWinkler(between:
            container.trimmedAndLowercased
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: preprocessed.filter({RecognitionTools.removeableChars.contains($0)}), with: "")
            ) >= level {
            return true
        }else{
            return false
        }
    }
    
    func stringEqual(container: String, preprocess: Bool) -> Bool {
        var preprocessed = self
        
        
        if preprocess {
            preprocessed = preprocessed.trimmedAndLowercased
            preprocessed = preprocessed.replacingOccurrences(of: " ", with: "")
            preprocessed = preprocessed.replacingOccurrences(of: preprocessed.filter({RecognitionTools.removeableChars.contains($0)}), with: "")
        }
        
        if preprocessed.elementsEqual(container.trimmedAndLowercased
        .replacingOccurrences(of: " ", with: "")
        .replacingOccurrences(of: preprocessed.filter({RecognitionTools.removeableChars.contains($0)}), with: ""))
        {
            return true
        }else{
            return false
        }
    }
    
    func countWords(separtedBy : String = " ") -> Int {
        return self.components(separatedBy: separtedBy).count
    }
    
}


extension Character {
    var isUppercase: Bool {
        let str = String(self)
        return str.isUppercased(at: str.startIndex)
    }
}
