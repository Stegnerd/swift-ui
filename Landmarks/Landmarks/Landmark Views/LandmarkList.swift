//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Dalton Stegner on 9/29/20.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var userData: UserData
    
    // this is like react state that affects the view overtime
    // this was traded out for an global object, but this is a way to watch things locally
    //@State var showFavoritesOnly = false
    
    
    var body: some View {
        
            // Lists work with identifiable data. You can make your data
            // identifiable in one of two ways: by passing along with your data a
            // key path to a property that uniquely identifies each element, or by
            // making your data type conform to the Identifiable protocol
            // if the object does not conform to the identifiable, you need to
            // put this in the constructor: , id: \.id
            List{
                // you can use the $ to access a binding to a state/EnvironmentObject variable/ or its props
                Toggle(isOn: $userData.showFavoritesOnly){
                    Text("Favorites only")
                }
                
                // lists are used to group dynamic data together
                // by using one with a ForEach we are able to group dynamic data
                // with static data in an organized way
                ForEach(userData.landmarks){ landmark in
                    // this applies a filter of the state or the iterables property to show
                    // or hide the item
                    if(!self.userData.showFavoritesOnly || landmark.isFavorite){
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }.navigationBarTitle(Text("Landmarks"))
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LandmarkList().environmentObject(UserData())
        }
    }
}
