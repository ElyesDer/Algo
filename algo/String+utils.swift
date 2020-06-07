//
//  String+utils.swift
//  algo
//
//  Created by 360medlink Tunisia on 5/28/20.
//  Copyright © 2020 360medlink Tunisia. All rights reserved.
//

import Foundation

extension URL {
    var SLD: String? {
        return host?.components(separatedBy: ".").suffix(2).joined(separator: ".")
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

extension String {
    
    var condenseWhitespace : String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
   
    
    var stripAllNonLetterWithDash : String {
        let okayChars =
                    CharacterSet.uppercaseLetters
//                    .union(CharacterSet.alphanumerics)
//                    .union(CharacterSet.capitalizedLetters)
                    .union(CharacterSet.whitespacesAndNewlines)
                    .union(CharacterSet.lowercaseLetters)
        //            .union(CharacterSet.punctuationCharacters)
//                        .union(CharacterSet(charactersIn: ":/-_\\+,;()&\".@"))
                return String(self.unicodeScalars.filter{okayChars.contains($0) })
    }
    
    var stripped: String {
        let okayChars =
            CharacterSet.alphanumerics
            .union(CharacterSet.alphanumerics)
            .union(CharacterSet.capitalizedLetters)
            .union(CharacterSet.whitespacesAndNewlines)
            .union(CharacterSet.uppercaseLetters)
//            .union(CharacterSet.punctuationCharacters)
                .union(CharacterSet(charactersIn: ":/-_\\+,;()&\".@"))
        return String(self.unicodeScalars.filter{okayChars.contains($0) })
        
        //rangeOfCharacter(from: CharacterSet.decimalDigits.inverted)
//        return rangeOfCharacter(from: okayChars) == nil
    }
    
    
    var withoutSpecialCharacters: String {
        return self.components(separatedBy: CharacterSet.symbols).joined(separator: "")
    }
    
    var preprocessPhoneKit : String {
        return self.trimmedAndLowercased
        .replacingOccurrences(of: " ", with: "")
        .replacingOccurrences(of: "-", with: "")
        .replacingOccurrences(of: "+ ", with: "+")
    }
    
    func replacingFirstOccurrenceOf(
            target: String, withString replaceString: String) -> String
    {
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replaceString)
        }
        return self
    }
    
    mutating func insert(string:String,ind:Int) {
        self.insert(contentsOf: string, at:self.index(self.startIndex, offsetBy: ind) )
    }
    
    func lastIndexInt(of char: Character) -> Int? {
        return lastIndex(of: char)?.utf16Offset(in: self)
    }
    
    func firstIndexInt(of char: Character) -> Int? {
        return firstIndex(of: char)?.utf16Offset(in: self)
    }
    
    
    func substring(from:Int, toSubstring s2 : String) -> Substring? {
        guard let r = self.range(of:s2) else {return nil}
        var s = self.prefix(upTo:r.lowerBound)
        s = s.dropFirst(from)
        return s
    }
    
    
    func matchingStrings(regex: String) -> [[String]] {
        guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return [] }
        let nsString = self as NSString
        let results  = regex.matches(in: self, options: [], range: NSMakeRange(0, nsString.length))
        return results.map { result in
            (0..<result.numberOfRanges).map {
                result.range(at: $0).location != NSNotFound
                    ? nsString.substring(with: result.range(at: $0))
                    : ""
            }
        }
    }
    
    var preprocess : String {
        return self.trimmedAndLowercased
        .replacingOccurrences(of: " ", with: "")
        .replacingOccurrences(of: "-", with: "")
    }
    
    
    
    //validate PhoneNumber
    var isPhoneNumber: Bool {
        let charcter  = NSCharacterSet(charactersIn: "+()0123456789").inverted
        var filtered:NSString!
        let inputString:NSArray = self.components(separatedBy: charcter) as NSArray
        filtered = inputString.componentsJoined(by: "") as NSString
        return ( self == filtered as String ) && self.count > 3
    }
    //validate parentheses
    var hasParntheses: Bool {
        
        let charcter  = NSCharacterSet(charactersIn: "()").inverted
        var filtered:NSString!
        let inputString:NSArray = self.components(separatedBy: charcter) as NSArray
        filtered = inputString.componentsJoined(by: "") as NSString
        return  self == filtered as String
    }
    
    func isValidEmail() -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    var trimmedAndLowercased : String {
        return self.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var trimmed:String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    func getEmails() -> [String] {
        if let regex = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: .caseInsensitive)
        {
            let string = self as NSString
            
            return regex.matches(in: self, options: [], range: NSRange(location: 0, length: string.length)).map {
                string.substring(with: $0.range).replacingOccurrences(of: "", with: "").lowercased()
            }
        }
        return []
    }
    func getPOBoxAddress() -> [String]  {
        if let regex = try? NSRegularExpression(pattern: "([p|P][\\s]*[o|O][\\s]*[b|B][\\s]*[o|O][\\s]*[x|X][\\s]*[a-zA-Z0-9]*|\\b[P|p]+(OST|ost|o|O)?\\.?\\s*[O|o|0]+(ffice|FFICE)?\\.?\\s*[B|b][O|o|0]?[X|x]|\\b[(B|b)|(BO|Bo|bo)|(Box|box)]*[p|P|Postal|postal]+\\.?\\s+[#]?(\\d+)*(\\D+))", options: .caseInsensitive)
        {
            let string = self as NSString
            
            return regex.matches(in: self, options: [], range: NSRange(location: 0, length: string.length)).map {
                string.substring(with: $0.range).replacingOccurrences(of: "", with: "").lowercased()
            }
        }
        return []
    }
    
    
    func getAdvancedPOBoxAddress() -> [String]  {
        
        /*
         V1 : "(?i)^\\s*(.*((p|post)[-.\\s]*(o|off|office)[-.\\s]*(b|box|bin)[-.\\s]*)|.*((p|post)[-.\\s]*(o|off|office)[-.\\s]*)|.*((p|post)[-.\\s]*(b|box|bin)[-.\\s]*)|(box|bin)[-.\\s]*)(#|n|num|number)?\\s*\\d+"
         
         
    V2 : Enhanced , remove string from stirng
         (((p|post)[-.\s]*(o|off|office)[-.\s]*(b|box|bin)[-.\s]*)|.*((p|post)[-.\s]*(o|off|office)[-.\s]*)|.*((p|post)[-.\s]*(b|box|bin)[-.\s]*)|(box|bin)[-.\s]*)(#|n|num|number)?\s*\d+
        */
        
        
        if let regex = try? NSRegularExpression(pattern: "(((p|post)[-.\\s]*(o|off|office)[-.\\s]*(b|box|bin)[-.\\s]*)|.*((p|post)[-.\\s]*(o|off|office)[-.\\s]*)|.*((p|post)[-.\\s]*(b|box|bin)[-.\\s]*)|(box|bin)[-.\\s]*)(#|n|num|number)?\\s*\\d+", options: .caseInsensitive)
        {
            let string = self as NSString
            
            return regex.matches(in: self, options: [], range: NSRange(location: 0, length: string.length)).map {
                string.substring(with: $0.range).replacingOccurrences(of: "", with: "").lowercased()
            }
        }
        return []
    }
    func getWebSites() -> [String] {
        if let regex = try? NSRegularExpression(pattern: "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,4}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?", options: .caseInsensitive)
        {
            let string = self as NSString
            
            return regex.matches(in: self, options: [], range: NSRange(location: 0, length: string.length)).map {
                string.substring(with: $0.range).replacingOccurrences(of: "", with: "").lowercased()
            }
        }
        return []
    }
    
    // String metrics methods
    /**
     Get distance between target. (alias of `distanceJaroWinkler`.)
     - parameter target: target string
     - returns: Jaro-Winkler distance
     */
    public func distance(between target: String) -> Double {
        return distanceJaroWinkler(between: target)
    }
    
    /**
     Get Levenshtein distance between target.
     Reference <https://en.wikipedia.org/wiki/Levenshtein_distance#Iterative_with_two_matrix_rows>.
     - parameter target: target string
     - returns: Levenshtein distance
     */
    public func distanceLevenshtein(between target: String) -> Int {
        let selfCount = self.count
        let targetCount = target.count
        
        if self == target {
            return 0
        }
        if selfCount == 0 {
            return targetCount
        }
        if targetCount == 0 {
            return selfCount
        }
        
        // The previous row of distances
        var v0 = [Int](repeating: 0, count: targetCount + 1)
        // Current row of distances.
        var v1 = [Int](repeating: 0, count: targetCount + 1)
        // Initialize v0.
        // Edit distance for empty self.
        for i in 0..<v0.count {
            v0[i] = i
        }
        
        for (i, selfCharacter) in self.enumerated() {
            // Calculate v1 (current row distances) from previous row v0
            // Edit distance is delete (i + 1) chars from self to match empty t.
            v1[0] = i + 1
            
            // Use formula to fill rest of the row.
            for (j, targetCharacter) in target.enumerated() {
                let cost = selfCharacter == targetCharacter ? 0 : 1
                v1[j + 1] = Swift.min(
                    v1[j] + 1,
                    v0[j + 1] + 1,
                    v0[j] + cost
                )
            }
            
            // Copy current row to previous row for next iteration.
            for j in 0..<v0.count {
                v0[j] = v1[j]
            }
        }
        
        return v1[targetCount]
    }
    
    
    /**
     Get Damerau-Levenshtein distance between target.
     Reference <https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#endnote_itman#Distance_with_adjacent_transpositions>
     - parameter target: target string
     - returns: Damerau-Levenshtein distance
     */
    
    
    /**
     Get Hamming distance between self and target.
     Note: only applicable when string lengths are equal.
     Reference <https://en.wikipedia.org/wiki/Hamming_distance>.
     - parameter target: target string
     - returns: Hamming distance
     */
    public func distanceHamming(between target: String) -> Int {
        assert(self.count == target.count)
        
        return zip(self, target).filter { $0 != $1 }.count
    }
    
    func MostFreqKHashing(str: String, K: Int) -> [Character: Int] {
        // If `str` is shorter than `K` characters, use `str.count`
        let clampedK = min(K, str.count)
        var freq: [Character: Int] = [:]
        for char in str {
            freq[char] = (freq[char] ?? 0) + 1
        }
        
        var KFreq: [Character: Int] = [:]
        let sortedFreqs = freq.sorted { (charFreq1, charFreq2) -> Bool in
            // If frequencies are equal, sort against character index in `str`
            if charFreq1.value == charFreq2.value {
                return str.firstIndex(of: charFreq1.key)! < str.firstIndex(of: charFreq2.key)!
            }
            return charFreq1.value > charFreq2.value
        }
        for (char, count) in sortedFreqs[0..<clampedK]{
            KFreq[char] = count
        }
        
        return KFreq
    }
    
    func MostFreqKSimilarity(freq1: [Character: Int], freq2: [Character: Int]) -> Int {
        var similarity = 0
        for (char, count1) in freq1 {
            if freq2[char] != nil {
                similarity += count1
            }
        }
        return similarity
    }
    
    /**
     Get most frequent K distance.
     Reference <https://web.archive.org/web/20191117082524/https://en.wikipedia.org/wiki/Most_frequent_k_characters>.
     - parameters:
     - target: target string
     - K: number of characters
     - maxDistance: max distance (default to 10)
     - returns: most frequent K distance
     */
    public func distanceMostFreqK(between target: String, K: Int, maxDistance: Int = 10) -> Int {
        return maxDistance - MostFreqKSimilarity(
            freq1: MostFreqKHashing(str: self, K: K),
            freq2: MostFreqKHashing(str: target, K: K))
    }
    
    
    /**
     Get Jaro-Winkler distance.
     (Score is normalized such that 0 equates to no similarity and 1 is an
     exact match.)
     <https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance>
     - parameter target: target string
     - returns: Jaro-Winkler distance
     */
    public func distanceJaroWinkler(between target: String) -> Double {
        var stringOne = self
        var stringTwo = target
        if stringOne.count > stringTwo.count {
            stringTwo = self
            stringOne = target
        }
        
        let stringOneCount = stringOne.count
        let stringTwoCount = stringTwo.count
        
        if stringOneCount == 0 && stringTwoCount == 0 {
            return 1.0
        }
        
        let matchingDistance = stringTwoCount / 2
        var matchingCharactersCount: Double = 0
        var transpositionsCount: Double = 0
        var previousPosition = -1
        
        // Count matching characters and transpositions.
        for (i, stringOneChar) in stringOne.enumerated() {
            for (j, stringTwoChar) in stringTwo.enumerated() {
                if max(0, i - matchingDistance)..<min(stringTwoCount, i + matchingDistance) ~= j {
                    if stringOneChar == stringTwoChar {
                        matchingCharactersCount += 1
                        if previousPosition != -1 && j < previousPosition {
                            transpositionsCount += 1
                        }
                        previousPosition = j
                        break
                    }
                }
            }
        }
        
        if matchingCharactersCount == 0.0 {
            return 0.0
        }
        
        // Count common prefix (up to a maximum of 4 characters)
        let commonPrefixCount = min(max(Double(self.commonPrefix(with: target).count), 0), 4)
        
        let jaroSimilarity = (matchingCharactersCount / Double(stringOneCount) + matchingCharactersCount / Double(stringTwoCount) + (matchingCharactersCount - transpositionsCount) / matchingCharactersCount) / 3
        
        // Default is 0.1, should never exceed 0.25 (otherwise similarity score could exceed 1.0)
        let commonPrefixScalingFactor = 0.1
        
        return jaroSimilarity + commonPrefixCount * commonPrefixScalingFactor * (1 - jaroSimilarity)
    }
    
}

extension String {
    
    var localizable : String {
        get {
            return NSLocalizedString(self, comment: "")
        }
    }
    
    
    
}
