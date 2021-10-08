//
//  PokeStatViewGroup.swift
//  PokeBularry V.1.1
//
//  Created by Benjamin Purbowasito on 08/10/21.
//

import SwiftUI

struct PokeStatViewGroup: View {
    var pokemon: Pokemon
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 250)
                .foregroundColor(.white)
                .opacity(0.6)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 20) {
                
                //attack stat bar
                PokeStatView(pokemon: pokemon, statName: "ATT", statColor: .red, statValue: pokemon.attack)
                //defense stat bar
                PokeStatView(pokemon: pokemon, statName: "DEF", statColor: .blue, statValue: pokemon.attack)
                //height stat bar
                PokeStatView(pokemon: pokemon, statName: "HGH", statColor: .yellow, statValue: pokemon.attack)
                //weight stat bar
                PokeStatView(pokemon: pokemon, statName: "WGH", statColor: .black, statValue: pokemon.attack)
                
                
            }
        }
    }
}

struct PokeStatViewGroup_Previews: PreviewProvider {
    static var previews: some View {
        PokeStatViewGroup(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
