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
    
    @State var successCatch = false
    @State var failedCatch = false
    
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
                            catchPokemon(n: Int.random(in: 1...100))
                        }, label: {
                            Text("CATCH !")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            
                        }).sheet(isPresented: $successCatch, content: {
                            Text("Sucsessfull catching pokemon")
                                .foregroundColor(.black)
                        })
                            .sheet(isPresented: $failedCatch, content: {
                                Text("failed catching pokemon")
                                    .foregroundColor(.black)
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
    
    // function untuk catch pokemon dengan probabilitas 50%
    
    func catchPokemon(n: Int)  {
        
        if n % 2 == 1 {
            successCatch = true
        } else {
            failedCatch = true
        }
    }
    
    
}

struct PokeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokeDetailView(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
