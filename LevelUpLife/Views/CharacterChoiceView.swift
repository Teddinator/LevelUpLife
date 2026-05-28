//
//  CharacterChoiceView.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-22.
//

import SwiftUI

struct CharacterChoiceView: View {
    let characters = GameCharacter.developerPreview
    @State private var selectedIndex = 0
    @AppStorage("selectedCharacterName") private var selectedCharacterName = ""
    var selectedCharacter: GameCharacter {
        characters[selectedIndex]
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TabView(selection: $selectedIndex) {
                ForEach(characters.indices, id:\.self) { index in
                    let character = characters[index]
                    
                    VStack{
                        Image(character.name.lowercased())
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                        
                        Text(character.name)
                            .font(.title)
                            .bold()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .frame(height: 350)
            let character = selectedCharacter
            Text("\(character.name)")
            HStack() {
                Text("Health")
                    .fontWeight(.bold)
                Spacer()
                Text("Fight power")
                    .fontWeight(.bold)
                Spacer()
                Text("Spell damage")
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 15)
            HStack(){
                Text("\(character.health)")
                Spacer()
                Text("\(character.fightPower)")
                Spacer()
                Text("\(character.magicPower)")
            }
            .padding(.horizontal, 15)
            
            //Character description
            Text("\(character.charDescripton)")
                .padding(20)
            
            Spacer()
            NavigationLink {
                ModuleSelectorView()
            } label: {
                Text("Choose \(character.name)")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
                
            }
            .simultaneousGesture(TapGesture().onEnded {
                selectedCharacterName = selectedCharacter.name
            })
            Spacer()
        }
        .padding(.vertical, 100)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CharacterChoiceView()
}
