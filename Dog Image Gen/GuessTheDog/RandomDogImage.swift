//
//  RandomDogImage.swift
//  GuessTheDog
//
//  Created by Andy Huang on 8/12/23.
//

import Foundation

/*
 Model of the JSON returned by the dog api's random image endpoint.
 */
struct RandomDogImage: Codable {
    // TODO: Implement
    let message: String?
    let status: String?
    
    
}
