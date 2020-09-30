//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Dalton Stegner on 9/29/20.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        NavigationView {
            // Lists work with identifiable data. You can make your data
            // identifiable in one of two ways: by passing along with your data a
            // key path to a property that uniquely identifies each element, or by
            // making your data type conform to the Identifiable protocol
            // if the object does not conform to the identifiable, you need to
            // put this in the constructor: , id: \.id
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail()){
                    LandmarkRow(landmark: landmark)
                }
            }.navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
