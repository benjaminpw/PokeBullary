//
//  PokemonModel.swift
//  PokeBularry V.1.1
//
//  Created by Benjamin Purbowasito on 08/10/21.
//

import Foundation
import SwiftUI

struct Pokemon: Decodable, Identifiable {
    let pokeID = UUID()
    
    let id: Int
    let name: String
    var imageUrl = "imageUrl"
    let type: String
    let description: String
    
    let attack: Int
    let defense: Int
    let height: Int
    let weight: Int
    
}

enum CodingKeys: String, CodingKey {
    case id
    case name
    case imageURL = "imageUrl"
    case type
    case description
    case attack
    case defense
    case height
    case weight
}

//let mockPokemon: [Pokemon] = [
//    
//    .init(id: 1, name: "Bulbasaur1", imageUrl: "Bulbasaur", type: "Poison"),
//    .init(id: 2, name: "Bulbasaur2", imageUrl: "Bulbasaur", type: "Poison"),
//    .init(id: 3, name: "Bulbasaur3", imageUrl: "Bulbasaur", type: "Poison"),
//    .init(id: 4, name: "Bulbasaur4", imageUrl: "Bulbasaur", type: "Poison"),
//    .init(id: 5, name: "Bulbasaur5", imageUrl: "Bulbasaur", type: "Poison"),
//    
//    
//]
