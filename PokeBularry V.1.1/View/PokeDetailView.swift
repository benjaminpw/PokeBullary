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
                            
                            //SUCCESS CATCH MODAL
                        }).sheet(isPresented: $successCatch, content: {
                            SuccessAddModal(isPresented: self.$successCatch, didAddPokemon: {
                                
                                PokemonList in
                                print(PokemonList.nickname)
                                
                            })
                        })
                            .sheet(isPresented: $failedCatch, content: {
                                FailedAddModal(isPresented: self.$failedCatch)
                            })
                        
                        // CATCH BUTTON PROPERTY
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
    
    // Function untuk catch pokemon dengan probabilitas 50%
    
    func catchPokemon(n: Int)  {
        
        if n % 2 == 1 {
            successCatch = true
        } else {
            failedCatch = true
        }
    }
}

//STRUCT ketika catch berhasil
struct SuccessAddModal: View {
    
    @Binding var isPresented: Bool
    @State var nickName = ""
    
    var didAddPokemon: (PokemonList) -> ()
    
    var body: some View {
        VStack {
            HStack (spacing: 16) {
               Text("Pokemon Nickname")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
            TextField("Let's give your new Pokemon Name!", text: $nickName)
                    .foregroundColor(.black)
            }
            
            Button(action: {
                self.isPresented = false
                print("\(nickName)")
                
                self.didAddPokemon(.init(nickname: self.nickName, originName: self.nickName, image: "xxx"))
                
                
            }, label: {
                Text("Add")
                    .padding(.horizontal, 150)
                    .padding(.vertical,5)
                    .foregroundColor(.white)
                    .background(.green)
            })
            
            Button(action: {
                self.isPresented = false
            }, label: {
                Text("Cancel")
                    .foregroundColor(.black)
            })
            Spacer()
        }
        .padding(.all, 10)
    }
}

//STRUCT ketika catch gagal
struct FailedAddModal: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("Sorry The Pokemon run away")
                .foregroundColor(.black)
            Button(action: {
                self.isPresented = false
            }, label: {
                Text("Cancel")
                    .foregroundColor(.black)
            })
        }
    }
}

struct PokeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokeDetailView(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
