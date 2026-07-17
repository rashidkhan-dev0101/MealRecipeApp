//
//  ProfileHeader.swift
//  MealRecipeApp
//
//  Created by RASHID on 12/07/2026.
//



import SwiftUI

struct ProfileHeader: View {

    let name: String
    let email: String
    let photoURL: URL?

    var onChangePhoto: (() -> Void)?

    var body: some View {

        VStack(spacing: 18) {

            ZStack(alignment: .bottomTrailing) {

                if let photoURL {

                    AsyncImage(url: photoURL) { image in

                        image
                            .resizable()
                            .scaledToFill()

                    } placeholder: {

                        ProgressView()

                    }
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())

                } else {

                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray.opacity(0.5))
                        .frame(width: 120, height: 120)

                }

                Button {

                    onChangePhoto?()

                } label: {

                    Image(systemName: "camera.fill")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .frame(width: 36, height: 36)
                        .background(Color.orange)
                        .clipShape(Circle())
                        .shadow(radius: 5)

                }

            }
            .overlay {

                Circle()
                    .stroke(Color.orange.opacity(0.25), lineWidth: 4)

            }

            VStack(spacing: 5) {

                Text(name)
                    .font(.title.bold())

                Text(email)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

            }

        }
        .frame(maxWidth: .infinity)

    }
}

#Preview {

    VStack {

        ProfileHeader(
            name: "Rashid Khan",
            email: "rashid@gmail.com",
            photoURL: nil
        )

    }
    .padding()
}
