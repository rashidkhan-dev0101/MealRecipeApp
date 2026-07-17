//
//  LogoutButton.swift
//  MealRecipeApp
//
//  Created by RASHID on 12/07/2026.
//

import SwiftUI


struct LogoutButton: View {

    var action: () -> Void

    var body: some View {

        Button(action: action) {

            Text("Log Out")
                .font(.headline)
                .foregroundColor(.red)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .overlay {

                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.red, lineWidth: 1.5)

                }

        }

    }

}

#Preview {

    LogoutButton {

    }
    .padding()

}
