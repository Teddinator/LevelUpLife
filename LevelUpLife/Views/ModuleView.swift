//
//  ModuleView.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-26.
//

import SwiftData
import SwiftUI

struct ModuleView: View {
    let module: Module
    
    @AppStorage("selectedCharacterName") private var selectedCharacterName = ""
    
    var selectedCharacter: GameCharacter? {
        GameCharacter.developerPreview.first { $0.name == selectedCharacterName }
    }
    
    var body: some View {
        VStack(alignment: .center){
            
            if let character = selectedCharacter{
                Image(character.name.lowercased())
                    .resizable()
                    .scaledToFit()
                Text("Stats")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("Health").font(.headline)
                    Spacer()
                    Text("Fight Power").font(.headline)
                    Spacer()
                    Text("Magic Power").font(.headline)
                }
                .padding(.horizontal, 20)
                
                HStack {
                    Text("\(character.health)")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("\(character.fightPower)")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("\(character.magicPower)")
                        .font(.headline)
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 20)
            } else {
                Text("No character selected")
            }
            
            Text("Daily Task")
                .font(.title)
                .fontWeight(.bold)
            if let dailyTask = module.dailyTask{
                Button(dailyTask.title) {
                    
                }
                .padding()
            } else {
                Text("No daily task")
                    .foregroundStyle(.secondary)
            }
            
            Text("Weekly Tasks")
                .font(.title)
                .fontWeight(.bold)
            
            ForEach(module.weeklyTasks) { task in
                Button{
                    
                } label: {
                    HStack{
                        Text(task.title)
                        Spacer()
                        Text("\(task.amountCompleted)/\(task.amountRequired)")
                    }
                    .padding()
                    .background(.gray.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal)
            }
            Spacer()
        }
    }
}


#Preview {
    ModuleView(module: Module.developerPreview[0])
}
