//
//  ModuleView.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-26.
//

import SwiftData
import SwiftUI

struct ModuleView: View {
    
    var body: some View {
        VStack(alignment: .center){
            Image(.mage)
                .resizable()
                .scaledToFit()
            Text("Stats")
                .font(.title)
                .fontWeight(.bold)
            HStack(alignment: .center){
                Text("Health")
                    .font(.headline)
                
                Spacer()
                
                Text("Fight Power")
                    .font(.headline)
                
                Spacer()
                
                Text("Magic Power")
                    .font(.headline)
            }
            .padding(.horizontal, 20)
        }
        
        HStack(alignment: .center){
            Text("0")
                .font(.headline)
            
            Spacer()
            
            Text("0")
                .font(.headline)
            
            Spacer()
            
            Text("0")
                .font(.headline)
            
            Spacer()
            
        }
        .padding(.horizontal, 20)
        
        Text("Daily Task")
            .font(.title)
            .fontWeight(.bold)
        
        Button("Placeholder") {
            
        }
        .padding()
        
        Text("Weekly Tasks")
            .font(.title)
            .fontWeight(.bold)
        ForEach(0..<3, id: \.self) { task in
            Button("OK") {}
        }
        .padding()
        Spacer()
    }
}


#Preview {
    ModuleView()
}
