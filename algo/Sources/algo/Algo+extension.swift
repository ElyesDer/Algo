//
//  Algo+extension.swift
//  algo
//
//  Created by 360 medlink on 9/16/20.
//  Copyright © 2020 360medlink Tunisia. All rights reserved.
//

import Foundation


extension String {
    
    
    func stringExistsInArray(array : [String] ) -> Bool {
        
        array.filter { (element) -> Bool in
            let pattern = #"\b\#(self)\b"#
            if element.range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil {
                return true
            }else{return false}
        }.count > 0
    }
    
    
    func stringExistInArray(array : [String] , preprocess : Bool = true) -> Bool {
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
                
                .contains(preprocessed)// is not goood bcz for "med" --> "medical" is true
        }.count > 0
        
    }
    
    
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
    
    func beginWithTwoNumbers() -> Bool {
        return self[startIndex].isNumber && self[1].isNumber
    }
    
    func beginsWithNumber() -> Bool {
        return self[startIndex].isNumber
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
    
    /*
     print(preprocessed.distanceJaroWinkler(between: container))
     
     
     print(preprocessed.distanceLevenshtein(between: container))
     
     
     print(preprocessed.distance(between: container))
     */
    
    
    func stringEqualityDistance(container: String, preprocess: Bool, ratio : Double) -> Bool {
        var preprocessed = self
        
        
        if preprocess {
            preprocessed = preprocessed.trimmedAndLowercased
            preprocessed = preprocessed.replacingOccurrences(of: " ", with: "")
            preprocessed = preprocessed.replacingOccurrences(of: preprocessed.filter({RecognitionTools.removeableChars.contains($0)}), with: "")
        }
        
        
        let container = container.trimmedAndLowercased
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: container.filter({RecognitionTools.removeableChars.contains($0)}), with: "")
        
        
        return (Double(preprocessed.distanceLevenshtein(between: container)) / Double(preprocessed.count)) <= ratio
        
        /*
         if preprocessed.count > container.count {
         if preprocessed.contains(container)
         {
         return true
         }else{
         return false
         }
         }else {
         if container.contains(preprocessed)
         {
         return true
         }else{
         return false
         }
         }
         */
        
        
    }
    
    
    func stringContains(container: String, preprocess: Bool) -> Bool {
        var preprocessed = self
        
        
        if preprocess {
            preprocessed = preprocessed.trimmedAndLowercased
            preprocessed = preprocessed.replacingOccurrences(of: " ", with: "")
            preprocessed = preprocessed.replacingOccurrences(of: preprocessed.filter({RecognitionTools.removeableChars.contains($0)}), with: "")
        }
        
        
        // TODOOOOO : DONE FIX ; THE ONE WITH MORE LENGTH SHOULD .CONTAINS ( the lower length )
        
        let container = container.trimmedAndLowercased
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: container.filter({RecognitionTools.removeableChars.contains($0)}), with: "")
        
        if preprocessed.count > container.count {
            if preprocessed.contains(container)
            {
                return true
            }else{
                return false
            }
        }else {
            if container.contains(preprocessed)
            {
                return true
            }else{
                return false
            }
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


extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.upperBound
    }
    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
        var indices: [Index] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                indices.append(range.lowerBound)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return indices
    }
    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                result.append(range)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}


extension Array
{
    func filterDuplicate(_ keyValue:((AnyHashable...)->AnyHashable,Element)->AnyHashable) -> [Element]
    {
        func makeHash(_ params:AnyHashable ...) -> AnyHashable
        {
           var hash = Hasher()
           params.forEach{ hash.combine($0) }
           return hash.finalize()
        }
        var uniqueKeys = Set<AnyHashable>()
        return filter{uniqueKeys.insert(keyValue(makeHash,$0)).inserted}
    }
}
