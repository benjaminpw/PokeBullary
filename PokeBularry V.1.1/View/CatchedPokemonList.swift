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
    
    @State var isPresentingAddModal = false
    
    var body: some View {
        NavigationView {
            List(pokemonList) { PokemonList in
                PokemonRow(pokemonList: PokemonList, didDelete: {
                    p in self.pokemonList.removeAll(where: {$0.id == PokemonList.id})
                })
            }
            .navigationBarTitle("Pokemon List")
            .navigationBarItems(trailing: Button(action: {
                self.isPresentingAddModal.toggle()
                print("trying to add pokemon")
            }, label: {
                Text("Add")
                    .padding()
                    .foregroundColor(.white)
                    .background(.green)
            }))
            .sheet(isPresented: $isPresentingAddModal, content: {
                AddModal(isPresented: self.$isPresentingAddModal, didAddPokemon: {
                    
                    pokemonList in
                    
                    print(pokemonList.nickname)
                    self.pokemonList.append(pokemonList)
                })
            })
            
        }
    }
}

//STRUCT MODAL
struct AddModal: View {
    
    @Binding var isPresented: Bool
    @State var nickName = ""
    
    var didAddPokemon: (PokemonList) -> ()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center) {
                    Text("Nickname :")
                        .fontWeight(.bold)
                        .padding(.leading, 63)
                        .padding(.vertical,20)
                    HStack {
                        TextField("Pokemon Nickname", text: $nickName)
                    }
                    
                }
                
                HStack {
                    Text("Origin Name : ")
                    
                    HStack {
                        Text("Pokemon Origin Name")
                    }
                }
                
                Button(action: {
                    self.isPresented = false
                    self.didAddPokemon(.init(nickname: self.nickName, originName: "dummy", image: "xxx"))
                    
                }, label: {
                    Text("Add")
                        .padding(.all, 10)
                        .padding(.horizontal,120)
                        .foregroundColor(.white)
                        .background(.green)
                })
                
                Button(action: {
                    self.isPresented = false
                    
                }, label: {
                    Text("Cancel")
                        .padding(.all, 10)
                        .padding(.horizontal,110)
                        .foregroundColor(.white)
                        .background(.red)
                })
                Spacer()
                
            }
            .padding(.all, 16)
            .navigationTitle("Pokemon Nickname")
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
