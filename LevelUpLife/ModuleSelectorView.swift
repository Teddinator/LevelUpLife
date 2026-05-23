//
//  ModuleSelectorView.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-23.
//

import SwiftUI

struct ModuleSelectorView: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    var body: some View {
        NavigationStack {
            //MARK: Content
            VStack{
                Text("Choose your Adventure")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                Spacer()
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(0..<8, id:\.self) { number in
                            Button(action: {},
                                   label: {
                                Text("button \(number)")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .foregroundStyle(.cyan)
                                    .padding(15)
                            }
                            )
                            .buttonStyle(.glass)
                            .buttonBorderShape(.capsule)
                            .foregroundStyle(.black)
                            .padding(15)
                        }
                    }
                }
            }
        .background {
            //MARK: Background
            Image("AdventureBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}
}


#Preview {
    ModuleSelectorView()
}
