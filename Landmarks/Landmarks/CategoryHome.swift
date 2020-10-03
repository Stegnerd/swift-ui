//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Dalton Stegner on 10/2/20.
//

import SwiftUI

struct CategoryHome: View {
    
    // create a dictionary of string, list of landmark
    // where the key is the category type, and the landmarks are grouped based
    // on the enum category type
    var categories: [String: [Landmark]]{
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue}
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter {$0.isFeatured}
    }
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(categories.keys.sorted(), id: \.self ){ key in
                    // ! is using forced unwrapping, which means we know this has a value
                    // if it doesn't throw runtime error. like kotlin !!.
                    // https://stackoverflow.com/questions/24018327/what-does-an-exclamation-mark-mean-in-the-swift-language
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink (destination: LandmarkList()){
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            // sheet is like a modal
            .sheet(isPresented: $showingProfile){
                ProfileHost()
                    .environmentObject(self.userData)
            }
        }
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(UserData())
    }
}
