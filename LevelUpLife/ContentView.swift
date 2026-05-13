//
//  ContentView.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                //-MARK: Background
                LinearGradient(colors: [Color.blue, Color.pink], startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                
                //-MARK: Content
                VStack(alignment: .leading, spacing: 10){
                    Text("The app that will take your life to the next level \n Are you ready to level up?")
                    Text("")
                    Button(action: {
                        
                    }, label: {
                        Text("Get Started")
                            .foregroundStyle(.black)
                        
                    }
                    )
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                }
            }
            .navigationTitle("LevelUpLife")
        }
    }
}

#Preview {
    ContentView()
}
