//
//  PlayerStoreViewModel.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-29.
//

import Foundation
import Observation


@Observable
class PlayerStore {
    var character: GameCharacter? {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }
    
    func chooseCharacter(_ character: GameCharacter) {
        self.character = GameCharacter(
            name: character.name,
            charDescription: character.charDescripton,
            xp: character.xp,
            health: character.health,
            fightPower: character.fightPower,
            magicPower: character.magicPower
        )
    }
    
    func addXP(_ amount: Int) {
        guard var character else { return }
        
        character.xp += amount
        
        while character.xp >= 100 {
            character.xp -= 100
            
            character.health += 20
            character.fightPower += 10
            character.magicPower += 20
        }
        
        self.character = character
        save()
    }
    
    private func save() {
        guard let character else { return }
        
        if let data = try? JSONEncoder().encode(character) {
            UserDefaults.standard.set(data, forKey: "playerCharacter")
        }
    }
    
    private func load() {
        guard let data = UserDefaults.standard.data(forKey: "playerCharacter"),
              let decodedCharacter = try? JSONDecoder().decode(GameCharacter.self, from: data) else { return }
        
        character = decodedCharacter
    }
}
