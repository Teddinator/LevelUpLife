//
//  DataModels.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-26.
//

import Foundation
import Observation

@Observable
class GameCharacter: Identifiable {
    var id: UUID
    var name: String
    var charDescripton: String
    
    var xp: Int
    var health: Int
    var fightPower: Int
    var magicPower: Int
    
    init(id: UUID = UUID(), name: String, charDescription: String, xp: Int, health: Int, fightPower: Int, magicPower: Int) {
        self.id = id
        self.name = name
        self.charDescripton = charDescription
        self.xp = xp
        self.health = health
        self.fightPower = fightPower
        self.magicPower = magicPower
    }
    
    static let developerPreview: [GameCharacter] = [
        GameCharacter(name: "Mage", charDescription: "A mage that can throw fireballs", xp: 0, health: 200, fightPower: 100, magicPower: 300),
        GameCharacter(name: "Fighter", charDescription: "A ruthless and instinctive killer", xp: 0, health: 250, fightPower: 300, magicPower: 50),
        GameCharacter(name: "Tank", charDescription: "An immovable beast" , xp: 0, health: 400, fightPower: 150, magicPower: 50)
        ]
}

struct WeeklyTask: Identifiable, Codable {
    let id: UUID
    var title: String
    var amountRequired: Int
    var amountCompleted: Int
    var weekStartDate: Date
    
    var isCompleted: Bool {
        amountCompleted >= amountRequired
    }
    
    func isFromCurrentWeek(using calendar: Calendar = .current) -> Bool {
        calendar.isDate(weekStartDate, equalTo: Date(), toGranularity: .weekOfYear)
    }
}

struct DailyTask: Identifiable, Codable {
    let id: UUID
    var title: String
    var xpReward: Int
    var date: Date
    var isCompleted: Bool
    
    func isForToday(using calendar: Calendar = .current) -> Bool {
        calendar.isDateInToday(date)
    }
}

struct Module: Identifiable, Codable {
    let id: UUID
    var title: String
    var weeklyTasks: [WeeklyTask]
    var dailyTask: DailyTask?
}
