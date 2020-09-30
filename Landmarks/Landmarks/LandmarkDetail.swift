//
//  ContentView.swift
//  Landmarks
//
//  Created by Dalton Stegner on 9/26/20.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                // allows to bleed into top beside camera bump
                .edgesIgnoringSafeArea(.top)
                // when you specify only the height it automatically does the width
                .frame(height:300)
            
            // To layer image on top of something
            // give the image a negative offset vertically
            // and padding on the bottom
            CircleImage(image: landmark.image)
                // (pulls the image up out of its boundaries)
                .offset(y: -130)
                // (pulls what ever is below into boundaries)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }.padding()
            // this pushed everything to the top
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
