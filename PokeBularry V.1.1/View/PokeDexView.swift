//
//  PokeDexView.swift
//  PokeBularry V.1.1
//
//  Created by Benjamin Purbowasito on 08/10/21.
//

import SwiftUI

struct PokeDexView: View {
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(viewModel.pokemon) {
                        Pokemon in PokemonCard(pokemon: Pokemon, viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("Pokebullary")
        }
        
    }
}

struct PokeDexView_Previews: PreviewProvider {
    static var previews: some View {
        PokeDexView()
    }
}
