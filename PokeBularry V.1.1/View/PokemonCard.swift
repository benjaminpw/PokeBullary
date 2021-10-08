//
//  PokemonCard.swift
//  PokeBularry V.1.1
//
//  Created by Benjamin Purbowasito on 08/10/21.
//

import SwiftUI
import KingfisherSwiftUI

struct PokemonCard: View {
    
    let pokemon: Pokemon
    let viewModel: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemon: Pokemon, viewModel: PokemonViewModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.backgroundColor(pokemon.type))
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top,4)
                    .padding(.leading)
                
                HStack {
                    Text(pokemon.type.capitalized)
                        .font(.subheadline)
                        .italic()
                        .foregroundColor(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding([.bottom, .trailing], 10)
                    
//                    AsyncImage(url: URL(string: pokemon.imageUrl)) {
//                        phase in switch phase {
//                        case .empty: ProgressView()
//                        case .success(let image):
//                            image.resizable()
//                                .scaledToFit()
//                                .frame(width: 60, height: 60)
//                        case .failure(_):
//                            Image(systemName: "photo")
//                        @unknown default:
//                            EmptyView()
//                        }
//                    }
                    
                }
            }
            
        }
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: backgroundColor, radius: 6, x: 0.0, y: 0.0)
    }
}

//struct PokemonCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonCard(pokemon: mockPokemon[3])
//    }
//}
