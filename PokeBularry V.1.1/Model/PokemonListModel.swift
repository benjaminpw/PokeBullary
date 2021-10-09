//
//  PokemonListModel.swift
//  PokeBularry V.1.1
//
//  Created by Benjamin Purbowasito on 09/10/21.
//

import Foundation



struct PokemonList: Decodable, Identifiable {
    
    var id = UUID()
    
    let nickname: String
    let originName: String
    let image: String
   
}
