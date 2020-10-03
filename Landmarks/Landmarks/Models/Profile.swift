//
//  Profile.swift
//  Landmarks
//
//  Created by Dalton Stegner on 10/3/20.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications: Bool
    var seasonalPhoto: Season
    var goalDate: Date
    
    static let `default` = Self(username: "d_stegner", prefersNotifications: true, seasonalPhoto: .autumn)
    
    init(username: String, prefersNotifications: Bool = true, seasonalPhoto: Season = .autumn){
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
    
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}
