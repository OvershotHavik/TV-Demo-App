//
//  TVDemoTabView.swift
//  TV Demo App
//
//  Created by Steve Plavetzky on 3/14/22.
//

import SwiftUI

struct TVDemoTabView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Text("Home")
                }
            SearchView()
                .tabItem {
                    Text("Search")
                }
            ProfileView()
                .tabItem {
                    Text("Profile")
                }
        }
    }
}


