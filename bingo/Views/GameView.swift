//
//  GameView.swift
//  bingo
//
//  Created by Алексей Агеев on 26.05.2020.
//  Copyright © 2020 Alexey Ageev. All rights reserved.
//

import SwiftUI
import CoreHaptics

//let str: Bingo

struct GameView: View {

    let generator = UINotificationFeedbackGenerator()
    @State private var buttons = [
        [false, false, false, false, false],
        [false, false, false, false, false],
        [false, false, false, false, false],
        [false, false, false, false, false],
        [false, false, false, false, false]
    ]
    var bingo: Bingo
    let code = "123456"
    let colors = [Color.blue, Color.green, Color.orange, Color.pink, Color.purple, Color.red, Color.yellow]
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(0...4, id: \.self) { i in
                        HStack{
                            Spacer()
                            ForEach(0...4, id: \.self) { j in
                                Button(action: {
                                    if (CHHapticEngine.capabilitiesForHardware().supportsHaptics){
                                        if (self.buttons[i][j]){
                                            self.generator.notificationOccurred(.success)
                                        } else {
                                            self.generator.notificationOccurred(.warning)
                                        }
                                    }
                                    self.buttons[i][j] = !self.buttons[i][j]
                                }) {
                                    Text(self.bingo.words[5 * i + j])
                                    .lineLimit(nil)
                                    .frame(width: 170, height: 100)
//                                        .frame(width: self.bingo.maxWidth, height: 100)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(self.buttons[i][j] ? self.colors[Int.random(in: (0...6))] : Color.gray.opacity(0.3)))
                                    .buttonStyle(PlainButtonStyle())
                                    .foregroundColor(self.buttons[i][j] ? Color.white : Color.primary)
                                }
                            }
                            Spacer()
                        }
                        .fixedSize()
                    }
                }
            }
            Spacer()
        }
        .navigationBarTitle("Game \(code)", displayMode: .inline)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
//        Group {
//            GameView().colorScheme(.light)
//            GameView().colorScheme(.dark)
//        }
        EmptyView()
    }
}
