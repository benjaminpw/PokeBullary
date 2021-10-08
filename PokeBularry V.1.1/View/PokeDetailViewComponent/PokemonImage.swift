//
//  PokemonImage.swift
//  PokeBularry V.1.1
//
//  Created by Benjamin Purbowasito on 08/10/21.
//

import SwiftUI
import KingfisherSwiftUI

struct PokemonImage: View {
    
    var image: KFImage
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .shadow(radius: 5)
        
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage(image: KFImage(URL(string: PokemonViewModel().MOCK_POKEMON.imageUrl)))
    }
}
