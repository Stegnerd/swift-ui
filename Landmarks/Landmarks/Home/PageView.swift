//
//  PageView.swift
//  Landmarks
//
//  Created by Dalton Stegner on 10/3/20.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    // A UIHostingController is a UIViewController
    // subclass that represents a SwiftUI view within UIKit contexts
    var viewControllers: [UIHostingController<Page>]
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0 )}
    }
    
    var body: some View {
        PageViewController(controllers: viewControllers)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(features.map { FeatureCard(landmark: $0) })
            
            .aspectRatio(3/2, contentMode: .fit)
    }
}
