//
//  CharacterChoiceView.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-22.
//

import SwiftUI

struct CharacterChoiceView: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 10){
                ForEach(1..<4, id: \.self) { number in
                    Button(action:{}, label: {Text("Character \(number)")})
                }
                
            }
            .padding(.vertical, 100)
        
            Text("Stats")
            HStack() {
                Text("Health")
                    .font(.headline)
                Spacer()
                Text("Fight power")
                Spacer()
                Text("Spell damage")
            }
            .padding(.horizontal, 15)
            HStack(){
                Text("Stat1")
                Spacer()
                Text("Stat2")
                Spacer()
                Text("Stat3")
            }
            .padding(.horizontal, 15)
            
            //Character description
            Text("This is a character that's cool")
                .padding(15)
            
            Spacer()
        }
        .padding(.vertical, 100)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CharacterChoiceView()
}
