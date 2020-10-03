//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Dalton Stegner on 10/3/20.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                if self.mode?.wrappedValue == .active {
                    Button("Cancel"){
                        // sets the values back to what they were
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: draftProfile)
            } else {
                // notice that we pass $draft, to pass along the binding
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        // when loading the editor, give it the most up to date values of the
                        // global object
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear{
                        // when the editor closes set the global object to the new
                        // values from the editor
                        self.userData.profile = self.draftProfile
                    }
            }
            
            
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
