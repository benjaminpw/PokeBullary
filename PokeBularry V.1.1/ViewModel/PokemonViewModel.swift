//
//  PokemonViewModel.swift
//  PokeBularry V.1.1
//
//  Created by Benjamin Purbowasito on 08/10/21.
//

import Foundation
import UIKit


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
