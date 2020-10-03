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
    
    var body: some View {
        NavigationView {
            List{
                ForEach(categories.keys.sorted(), id: \.self ){ key in
                    Text(key)
                }
            }
            .navigationBarTitle(Text("Featured"))
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
