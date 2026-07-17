//
//  HomeHeader.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//
//
//  HomeHeader.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//

import SwiftUI
import Combine

struct HomeHeader: View {

    var userName: String
    var photoURL: URL?

    var onNotificationTap: (() -> Void)?
    var onProfileTap: (() -> Void)?

    var body: some View {

        HStack(alignment: .top) {

            VStack(alignment: .leading, spacing: 6) {

                Text("👋 Good Morning")
                    .font(.subheadline)
                    .foregroundStyle(.gray)

                Text(userName)
                    .font(.title2.bold())

                Text("Find Your")
                    .font(.system(size: 30, weight: .bold))

                Text("Favorite Recipe")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.orange)

            }

            Spacer()

            HStack(spacing: 12) {

                // MARK: Notification

                Button {

                    onNotificationTap?()

                } label: {

                    Image(systemName: "bell")
                        .font(.title3)
                        .foregroundColor(.primary)
                        .frame(width: 46, height: 46)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())

                }

                // MARK: Profile

                Button {

                    onProfileTap?()

                } label: {

                    if let photoURL {

                        AsyncImage(url: photoURL) { image in

                            image
                                .resizable()
                                .scaledToFill()

                        } placeholder: {

                            ProgressView()

                        }
                        .frame(width: 46, height: 46)
                        .clipShape(Circle())

                    } else {

                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                            .foregroundStyle(.white)
                            .frame(width: 46, height: 46)
                            .background(Color.orange)
                            .clipShape(Circle())

                    }

                }
                .buttonStyle(.plain)

            }

        }

    }

}

#Preview {

    HomeHeader(
        userName: "Rashid Khan",
        photoURL: nil
    )
    .padding()

}
