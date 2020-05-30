//
//  ContentView.swift
//  bingo
//
//  Created by Алексей Агеев on 26.05.2020.
//  Copyright © 2020 Alexey Ageev. All rights reserved.
//

import SwiftUI
//import JWTDecode

struct ContentView: View {
    @State private var selection = 0
    
    let colors = [Color.blue, Color.green, Color.orange, Color.pink, Color.purple, Color.red, Color.yellow]
    var body: some View {
        TabView(selection: $selection){
            ProfileView()
//                .environment(\.locale, .init(identifier: "ru"))
//                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: selection == 0 ? "person.fill" : "person")
                        Text("Profile")
                    }
                }
                .tag(0)
            BingoSelect()
//                GameView()
//                .environment(\.locale, .init(identifier: "ru"))
//                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: selection == 1 ? "gamecontroller.fill" : "gamecontroller" )
                        Text("Game")
                    }
                }
                .tag(1)
            FriendsView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: selection == 2 ? "person.3.fill" : "person.3")
                        Text("Friends")
                    }
                }
                .tag(2)
        }
        .accentColor(colors[Int.random(in: 0...6)])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
