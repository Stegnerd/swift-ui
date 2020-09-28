//
//  ContentView.swift
//  Landmarks
//
//  Created by Dalton Stegner on 9/26/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                // allows to bleed into top beside camera bump
                .edgesIgnoringSafeArea(.top)
                // when you specify only the height it automatically does the width
                .frame(height:300)
            
            // To layer image on top of something
            // give the image a negative offset vertically
            // and padding on the bottom
            CircleImage()
                // (pulls the image up out of its boundaries)
                .offset(y: -130)
                // (pulls what ever is below into boundaries)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }.padding()
            // this pushed everything to the top
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
