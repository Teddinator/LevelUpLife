//
//  CharacterChoiceView.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-22.
//

import SwiftUI

struct CharacterChoiceView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10){
                ForEach(0..<3, id: \.self) { number in
                    Button(action:{}, label: {Text("Character \(1)")})
                }
            }
        
            Spacer()
        }
        .padding(.vertical, 100)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CharacterChoiceView()
}
