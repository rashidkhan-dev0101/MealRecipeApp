//
//  ProfileMenuRow.swift
//  MealRecipeApp
//
//  Created by RASHID on 12/07/2026.
//
//
//  ProfileMenuRow.swift
//  MealRecipeApp
//
//  Created by RASHID on 12/07/2026.
//

import SwiftUI

struct ProfileMenuRow: View {

    let icon: String
    let title: String
    var action: (() -> Void)? = nil

    var body: some View {

        Button {

            action?()

        } label: {

            HStack(spacing: 16) {

                ZStack {

                    Circle()
                        .fill(Color.orange.opacity(0.15))
                        .frame(width: 46, height: 46)

                    Image(systemName: icon)
                        .font(.title3)
                        .foregroundColor(.orange)

                }

                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.subheadline)
                    .foregroundColor(.gray)

            }
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 18))

        }
        .buttonStyle(.plain)

    }

}

#Preview {

    VStack(spacing: 18) {

        ProfileMenuRow(
            icon: "person.crop.circle.fill",
            title: "Edit Profile"
        )

        ProfileMenuRow(
            icon: "heart.fill",
            title: "My Favorites"
        )

        ProfileMenuRow(
            icon: "bell.fill",
            title: "Notifications"
        )

        ProfileMenuRow(
            icon: "gearshape.fill",
            title: "App Settings"
        )

    }
    .padding()

}
