//
//  GameCell.swift
//  bingo
//
//  Created by Алексей Агеев on 23.06.2020.
//  Copyright © 2020 Alexey Ageev. All rights reserved.
//

import SwiftUI
import CoreHaptics

fileprivate let colors: [Color] = [.blue, .green, .orange, .pink, .purple, .red, .yellow]

struct GameCell: View {
    let word: String
    @Binding var isPressed: Bool
    @State private var color = Color.red
    var body: some View {
        Button(action: {
            if (CHHapticEngine.capabilitiesForHardware().supportsHaptics){
                if isPressed {
                    UINotificationFeedbackGenerator().notificationOccurred(.success)
                } else {
                    UINotificationFeedbackGenerator().notificationOccurred(.warning)
                }
            }
            isPressed = !isPressed
        }) {
            Text(word)
                .lineLimit(nil)
                .font(.headline)
                .multilineTextAlignment(.center)
//                .buttonStyle(PlainButtonStyle())
                .foregroundColor(isPressed ? Color.white : Color.primary)
                .frame(width: 170, height: 100)
        }
        .background(RoundedRectangle(cornerRadius: 10))
        .foregroundColor(isPressed ? colors.randomElement() : Color.gray.opacity(0.3))
    }
}

struct GameCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameCell(word: "TestWord", isPressed: .constant(false))
            GameCell(word: "TestWord", isPressed: .constant(true))
        }.previewLayout(.sizeThatFits)
    }
}
