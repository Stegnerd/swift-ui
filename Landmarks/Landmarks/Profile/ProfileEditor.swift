//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Dalton Stegner on 10/3/20.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List{
            HStack{
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications){
                Text("Enable Notifications")
            }
            
            VStack(alignment: .leading, spacing: 20){
                Text("Seasonal Photo").bold()
                
                Picker("Season Photo", selection: $profile.seasonalPhoto){
                    ForEach(Profile.Season.allCases, id: \.self){season in
                        // tag is like adding an id to the text rendered
                        Text(season.rawValue).tag(season)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }.padding(.top)
            
            VStack(alignment: .leading, spacing: 20){
                Text("Goal Date").bold()
                DatePicker(
                    "Goal Date",
                    selection: $profile.goalDate,
                    in: dateRange,
                    displayedComponents: .date
                )
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        // creates a binding that cannpt be changed
        ProfileEditor(profile: .constant(.default))
    }
}
