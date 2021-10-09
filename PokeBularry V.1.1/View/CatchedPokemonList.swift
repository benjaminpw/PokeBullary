//
//  CatchedPokemonList.swift
//  PokeBularry V.1.1
//
//  Created by Benjamin Purbowasito on 09/10/21.
//

import Foundation
import SwiftUI




struct CatchedPokemonList: View {
    
    @State var pokemonList: [PokemonList] = [
        
        .init(nickname: "Pokemon Air", originName: "Bulbasaur", image: "Bulbasaur"),
        .init(nickname: "Pokemon listrik", originName: "Pikachu", image: "Bulbasaur")
    ]
    
    var pokemon: Pokemon
    
    var body: some View {
        NavigationView {
            List(pokemonList) { PokemonList in
                PokemonRow(pokemonList: PokemonList, didDelete: {
                    p in self.pokemonList.removeAll(where: {$0.id == PokemonList.id})
                })
            }
            .navigationBarTitle("Pokemon List")
        }
    }
}

struct PokemonRow: View {
    var pokemonList: PokemonList
    var didDelete: (PokemonList) -> ()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(pokemonList.nickname)
                    .fontWeight(.bold)
                Text(pokemonList.originName)
                    .fontWeight(.light)
            }.layoutPriority(1)
            
            Spacer()
            
            Button(action: {
                self.didDelete(self.pokemonList)
            }, label: {
                Text("Release")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.all, 8)
                    .background(.red)
                    .cornerRadius(4)
            })
        }
    }
}

struct CatchedPokemonList_Previews: PreviewProvider {
    static var previews: some View {
        CatchedPokemonList(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
