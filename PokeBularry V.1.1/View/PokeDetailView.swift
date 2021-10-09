//
//  PokeDetailView.swift
//  PokeBularry V.1.1
//
//  Created by Benjamin Purbowasito on 08/10/21.
//

import SwiftUI
import KingfisherSwiftUI

struct PokeDetailView: View {
    
    var pokemon: Pokemon
    @State private var scale: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                Text(pokemon.type.capitalized)
                    .italic()
                
                
                PokemonImage(image: KFImage(URL(string: pokemon.imageUrl)))
                    .padding(.bottom, -150)
                    .zIndex(1)
                
                ZStack {
                    
                    Rectangle()
                    
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .foregroundColor(.gray)
                    
                    VStack {
                        
                        //BUTTON UNTUK CATCH
                        Button(action: {
                            print("tes masuk")
                        }, label: {
                            Text("CATCH !")
                        })
                            .foregroundColor(.white)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .background(.green)
                            .cornerRadius(20)
                        
                        Text(pokemon.description.replacingOccurrences(of: "\n", with: ""))
                            .foregroundColor(.white)
                            .padding()
                        
                        PokeStatViewGroup(pokemon: pokemon)
                            
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PokeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokeDetailView(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
