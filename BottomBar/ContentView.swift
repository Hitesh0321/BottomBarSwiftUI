//
//  ContentView.swift
//  BottomBar
//
//  Created by Hitesh Thummar on 03/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab:BottomBarSelectedTab = .home
    var body: some View {
        VStack {
            if selectedTab == .home{
                Text("Home")
            }
            
            if selectedTab == .search{
                Text("Search")
            }
            
            if selectedTab == .plus{
                Text("Add")
            }
            if selectedTab == .notification{
                Text("Notification")
            }
            if selectedTab == .profile{
                Text("Profile")
            }
            Spacer()
            BottomBar(selectedTab: $selectedTab)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
