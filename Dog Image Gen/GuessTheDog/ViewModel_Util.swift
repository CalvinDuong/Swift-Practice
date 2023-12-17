//
//  ViewModel_Util.swift
//  GuessTheDog
//
//  Created by Andy Huang on 8/12/23.
//

import Foundation

/* DO NOT MODIFY */
extension ViewModel {
    
    /*
     Returns a hint string for the current breed.
     
     Example: guess = "shiba"
     
        generateHintString() -> "s  _  _  _  a"
     */
    func generateHintString() -> String {
        var index: Int = -1
        let underlinedCharacters = self.breed.map { char in
            index += 1
            if index == 0 {
                return String(self.breed.first ?? "_")
            }
            
            if (index == self.breed.count - 1) && (self.breed.count >= 2) {
                return String(self.breed.last ?? "_")
            }
            return "_"
        }.joined(separator: "  ")
        
        if underlinedCharacters.count == 0 {
            return " "
        }
        
        return underlinedCharacters
    }
    
    /*
     Returns the general breed of the dog labeled in the image url.
     
     Example Usage:
     parseImageURLForBreed(imageURL: "message": "https://images.dog.ceo/breeds/mastiff-tibetan/n02108551_1719.jpg") -> "mastiff"
     parseImageURLForBreed(imageURL: "https://images.dog.ceo/breeds/affenpinscher/n02110627_13221.jpg") -> "affenpinscher"
     */
    func parseImageURLForBreed(imageURL: String) -> String {
        let split: [String] = imageURL.split(separator: "/").map {String($0)}
        
        if split.count < 4 {
            print("Unable to parse imageURL")
            return ""
        }
        
        let breed: String = split[3]
        
        if breed.contains("-") {
            return breed.split(separator: "-").map{String($0)}.first ?? ""
        }
        
        return breed
    }
}
