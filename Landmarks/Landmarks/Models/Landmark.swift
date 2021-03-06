//
//  Landmark.swift
//  Landmarks
//
//  Created by Dalton Stegner on 9/27/20.
//

import SwiftUI
import CoreLocation

// Hashable means this model abides to the proctocol for hashing (a method gets auto genrated)
// Codable (shorthand for encodable and decodable) json serialization
// Identifiable means that it can be used in iteration of lists
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude, longitude: coordinates.longitude
        )
    }
    
    var featureImage: Image? {
        guard isFeatured else { return nil}
        
        return Image(
            ImageStore.loadImage(name: "\(imageName)_feature"),
            scale: 2,
            label: Text(name)
        )
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}


struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
