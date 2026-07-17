//
//  CategoryDetailView.swift
//  MealRecipeApp
//

import SwiftUI

struct CategoryDetailView: View {

    let category: MealCategory

    @Environment(\.dismiss)
    private var dismiss

    var body: some View {

        GeometryReader { geometry in

        ZStack {

            Color.black
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(alignment: .leading, spacing: 0) {

                    // MARK: Hero Image

                    ZStack(alignment: .top) {

                        AsyncImage(url: URL(string: category.strCategoryThumb)) { image in

                            image
                                .resizable()
                                .scaledToFill()

                        } placeholder: {

                            ProgressView()

                        }
                        .frame(height: 340)
                        .frame(maxWidth: .infinity)
                        .clipped()

                        LinearGradient(
                            colors: [
                                .clear,
                                .black.opacity(0.25),
                                .black.opacity(0.95)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )

                        HStack {

                            Button {

                                dismiss()

                            } label: {

                                Image(systemName: "chevron.left")
                                    .font(.headline.bold())
                                    .foregroundStyle(.white)
                                    .frame(width: 46, height: 46)
                                    .background(.ultraThinMaterial)
                                    .clipShape(Circle())

                            }

                            Spacer()

                            Button {

                            } label: {

                                Image(systemName: "heart")
                                    .font(.headline.bold())
                                    .foregroundStyle(.white)
                                    .frame(width: 46, height: 46)
                                    .background(.ultraThinMaterial)
                                    .clipShape(Circle())

                            }

                        }
                        .padding(.horizontal)
                        .padding(.top, 60)

                    }

                    // MARK: Floating Card

                    VStack(alignment: .leading, spacing: 24) {

                        HStack {

                            RatingChip(
                                icon: "star.fill",
                                text: "4.8",
                                color: .yellow
                            )

                            RatingChip(
                                icon: "fork.knife",
                                text: "120 Recipes",
                                color: .orange
                            )

                            Spacer()

                        }

                        Text(category.strCategory)
                            .font(.system(size: 34, weight: .bold))
                            .foregroundStyle(.white)

                        VStack(alignment: .leading, spacing: 12) {

                            Text("About")
                                .font(.title2.bold())
                                .foregroundStyle(.white)

                            Text(category.strCategoryDescription)
                                .foregroundStyle(.gray)
                                .lineSpacing(6)

                        }

                        VStack(alignment: .leading, spacing: 12) {

                            Text("Popular For")
                                .font(.title2.bold())
                                .foregroundStyle(.white)

                            ScrollView(.horizontal, showsIndicators: false) {

                                HStack(spacing: 12) {

                                    TagView(title: "Steak")
                                    TagView(title: "Burger")
                                    TagView(title: "BBQ")
                                    TagView(title: "Grill")
                                    TagView(title: "Roast")

                                }

                            }

                        }

                        NavigationLink {

                            CategoryMealsView(category: category)

                        } label: {

                            HStack {

                                Spacer()

                                Text("Explore Recipes")
                                    .font(.headline.bold())

                                Image(systemName: "arrow.right")

                                Spacer()

                            }
                            .foregroundStyle(.white)
                            .frame(height: 58)
                            .background(

                                LinearGradient(
                                    colors: [.orange, .red],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )

                            )
                            .clipShape(RoundedRectangle(cornerRadius: 18))

                        }

                    }
                    .padding(24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(

                        RoundedRectangle(cornerRadius: 32)
                            .fill(Color.black)

                    )
                    .offset(y: -40)

                }
                .frame(width: geometry.size.width, alignment: .leading)

            }
            .frame(width: geometry.size.width)

        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)

        }

    }

}

// MARK: Rating Chip

struct RatingChip: View {

    let icon: String
    let text: String
    let color: Color

    var body: some View {

        HStack(spacing: 6) {

            Image(systemName: icon)

            Text(text)

        }
        .font(.subheadline.bold())
        .foregroundStyle(.white)
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(color.opacity(0.18))
        .clipShape(Capsule())

    }

}

// MARK: Tag

struct TagView: View {

    let title: String

    var body: some View {

        Text(title)
            .font(.subheadline.bold())
            .foregroundStyle(.orange)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.orange.opacity(0.15))
            .clipShape(Capsule())

    }

}
