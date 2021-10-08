//
//  PokeStatView.swift
//  PokeBularry V.1.1
//
//  Created by Benjamin Purbowasito on 08/10/21.
//

import SwiftUI

struct PokeStatView: View {
    
    var pokemon: Pokemon
    var statName: String
    var statColor: Color
    var statValue: Int
    
    
    var body: some View {
        HStack {
            Text(statName)
                .font(.system(.body, design: .monospaced))
            
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray)
                    .frame(width: 150, height: 30)
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(statColor)
                    .frame(width: statValue <= 100 ? 150 * (CGFloat(statValue) / 100) : 150, height: 30)
            }
            Text("\(statValue)")
                .font(.system(.body, design: .monospaced))
        }
    }
}

struct PokeStatView_Previews: PreviewProvider {
    static var previews: some View {
        PokeStatView(pokemon: PokemonViewModel().MOCK_POKEMON, statName: "Atk", statColor: .red, statValue: 90)
    }
}
