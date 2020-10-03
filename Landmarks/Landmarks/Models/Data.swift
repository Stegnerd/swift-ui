//
//  Data.swift
//  Landmarks
//
//  Created by Dalton Stegner on 9/27/20.
//
// Abstract:
// Helpers for loading images and data.

import UIKit
import SwiftUI
import CoreLocation

// this is an array of Landmark
let landmarkData: [Landmark] = load("landmarkData.json")
let features = landmarkData.filter {$0.isFeatured}
let hikeData: [Hike] = load("hikeData.json")

// takes in a generic that can be deserialized and returns generic
// for example above it takes in a json file string name and returns
// an array of Landmark
func load<T: Decodable>(_ filename: String) -> T {
    let data : Data
    
    // like kotlin ? if file exits, set the variable else fatal error
    guard
        let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        // https://developer.apple.com/documentation/foundation/data
        // this is a foundation class (a byte buffer in memory
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) in main bundle.")
    }
    
    do{
        let decoder = JSONDecoder()
        // decode from data type T.self (in this case [Landmark], from source of data byte buffer
        // decode (into type, and from source)
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    // like renaming a type, in this case calling a dictionary of [String: CGImage]
    // _imageDicationary name
    typealias _imageDictionary = [String: CGImage]
    // intializing _imageDictionary (which is actually a dictionary of [String: CGImage] as an empty dictionary
    // fileprivate is like private but to whole file
    fileprivate var images: _imageDictionary = [:]
    
    fileprivate static var scale = 2
    
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }
    
    static func loadImage(name: String) -> CGImage{
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    // give in a name, returns an index of that image if it exists
    // if not load that image and add it to the dictionary
    fileprivate func _guaranteeImage(name: String) -> _imageDictionary.Index {
        if let index = images.index(forKey: name){
            return index
        }
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}
