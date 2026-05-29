//
//  DataModels.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-26.
//

import Foundation

struct GameCharacter: Identifiable, Codable {
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
}

struct WeeklyTask: Identifiable, Codable {
    var id: UUID
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
    var id: UUID = UUID()
    var title: String
    var xpReward: Int
    var date: Date
    var isCompleted: Bool = false
    
    func isForToday(using calendar: Calendar = .current) -> Bool {
        calendar.isDateInToday(date)
    }
}

struct Module: Identifiable, Codable {
    var id: UUID
    let name: String
    var weeklyTasks: [WeeklyTask]
    var dailyTask: DailyTask?
    
    static let developerPreview: [Module] = [
        Module(id: UUID(), name: "Training", weeklyTasks: [
            WeeklyTask(
                id: UUID(),
                title: "Workout",
                amountRequired: 3, amountCompleted: 0,
                weekStartDate: Date()
            )
        ],
            dailyTask: DailyTask(
                id: UUID(),
                title: "Do 10 pushups",
                xpReward: 20,
                date: Date(),
                isCompleted: false
            )
        ),
        Module(id: UUID(),
               name: "Study",
               weeklyTasks: [
                WeeklyTask(
                    id: UUID(),
                    title: "Study session",
                    amountRequired: 5,
                    amountCompleted: 0,
                    weekStartDate: Date()
                )
               ],
              dailyTask: DailyTask(
                id: UUID(),
                title: "Read 10 pages",
                xpReward: 15,
                date: Date(),
                isCompleted: false
              )
              )
    ]
}

extension GameCharacter {
    static let developerPreview: [GameCharacter] = [
        GameCharacter(name: "Mage", charDescription: "A mage that can throw fireballs", xp: 0, health: 200, fightPower: 100, magicPower: 300),
        GameCharacter(name: "Fighter", charDescription: "A ruthless and instinctive killer", xp: 0, health: 250, fightPower: 300, magicPower: 50),
        GameCharacter(name: "Tank", charDescription: "An immovable beast" , xp: 0, health: 400, fightPower: 150, magicPower: 50)
        ]
}
