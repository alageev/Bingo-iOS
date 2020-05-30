//
//  FriendsView.swift
//  bingo
//
//  Created by Алексей Агеев on 30.05.2020.
//  Copyright © 2020 Alexey Ageev. All rights reserved.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        NavigationView {
            NavigationLink (destination:
                NavigationView {
                    NavigationLink(destination:
                        Text("HI!")
                    ){
                        Text("Greet")
                    }
                }
            ){
                Text("Hello, World!")
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
