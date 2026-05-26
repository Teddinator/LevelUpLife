//
//  DataModels.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-26.
//

import Foundation

struct GameCharacter: Identifiable, Codable {
    let id: UUID
    var imageName: String
    var name: String
    var description: String
    
    var xp: Int
    var health: Int
    var fightPower: Int
    var magicPower: Int
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
