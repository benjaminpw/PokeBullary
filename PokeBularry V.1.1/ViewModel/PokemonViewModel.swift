//
//  PokemonViewModel.swift
//  PokeBularry V.1.1
//
//  Created by Benjamin Purbowasito on 08/10/21.
//

import Foundation
import UIKit
import SwiftUI


class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemon()
    }
    
    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            guard let data = data?.parseData(removeString: "null,") else {
                return
            }
            
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    func backgroundColor(_ type: String) -> UIColor {
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemBlue
        case "electric": return .systemYellow
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemTeal
        case "fairy": return .systemPink
        default: return .systemIndigo
        }
    }
  // MOCK DESCRIPTION OF POKEMON 
    let MOCK_POKEMON = Pokemon(id: 0, name: "Bulbasaur", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&", type: "poison", description: "This is a test example of what the text in the description would look like for the given pokemon. This is a test example of what the text in the description would look like for the given pokemon.", attack: 49, defense: 52, height: 10, weight: 98)
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataString = String(data: self, encoding: .utf8)
        let parseDataString = dataString?.replacingOccurrences(of: string, with: "")
        
        guard let data = parseDataString?.data(using: .utf8) else {
            return nil
        }
        return data
    }
}
