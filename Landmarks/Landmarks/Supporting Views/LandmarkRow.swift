//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Dalton Stegner on 9/29/20.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        // you can access a json object just by referencing the file
        LandmarkRow(landmark: landmarkData[0])
    }
}
