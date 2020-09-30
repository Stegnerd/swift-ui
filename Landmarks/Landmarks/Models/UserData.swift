//
//  UserData.swift
//  Landmarks
//
//  Created by Dalton Stegner on 9/30/20.
//

import SwiftUI
import Combine

// ObservableObject proto just means swiftui subscibes to our object and updates any views that are watching it
// it only does this for "Published properties" that will be emitted
// link to observableobject protocol: https://developer.apple.com/documentation/combine/observableobject
// link to combine framework: https://developer.apple.com/documentation/combine
final class UserData: ObservableObject {
    // property needs this in order to emitted for the ObservableObject protocol
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}

