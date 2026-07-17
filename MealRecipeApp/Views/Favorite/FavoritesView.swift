//
//  Favorite.swift
//  MealRecipeApp
//
//  Created by RASHID on 12/07/2026.
//
import SwiftUI

struct FavoritesView: View {

    @StateObject
    private var viewModel = FavoriteViewModel()

    var body: some View {

        NavigationStack {

            Group {

                if viewModel.favorites.isEmpty {

                    VStack(spacing: 16) {

                        Image(systemName: "heart.slash")

                            .font(.system(size: 70))

                            .foregroundStyle(.gray)

                        Text("No Favorites Yet")
                            .font(.title2.bold())

                        Text("Your favorite recipes will appear here.")

                            .foregroundStyle(.secondary)

                    }

                }

                else {

                    ScrollView {

                        LazyVStack(spacing: 20) {

                            ForEach(viewModel.favorites) { meal in

                                HStack(spacing: 16) {

                                    AsyncImage(url: URL(string: meal.image)) { image in

                                        image
                                            .resizable()

                                    } placeholder: {

                                        Color.gray.opacity(0.2)

                                    }

                                    .scaledToFill()

                                    .frame(width: 90, height: 90)

                                    .clipShape(RoundedRectangle(cornerRadius: 18))

                                    VStack(alignment: .leading) {

                                        Text(meal.title)

                                            .font(.headline)

                                    }

                                    Spacer()

                                }

                                .padding()

                                .background(Color(.systemGray6).opacity(0.08))

                                .clipShape(RoundedRectangle(cornerRadius: 20))

                            }

                        }

                        .padding()

                    }

                }

            }

            .navigationTitle("Favorites")

        }

    }

}
