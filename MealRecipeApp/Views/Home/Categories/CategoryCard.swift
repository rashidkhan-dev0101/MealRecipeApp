import SwiftUI
import Combine

struct CategoryCard: View {
    
    @StateObject
    private var favoriteVM = FavoriteViewModel()

    let category: MealCategory

    var body: some View {

        ZStack {

            AsyncImage(url: URL(string: category.strCategoryThumb)) { image in

                image
                    .resizable()
                    .scaledToFill()

            } placeholder: {

                Color.gray.opacity(0.15)

            }
            .frame(height: 240)
            .frame(maxWidth: .infinity)
            .clipped()

            LinearGradient(
                colors: [
                    .clear,
                    .black.opacity(0.2),
                    .black.opacity(0.95)
                ],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack {

                // MARK: Favorite Button

                HStack {

                    Spacer()

                    Button {

                        favoriteVM.toggle(category: category)

                    } label: {

                        Image(systemName:
                                favoriteVM.isFavorite(category)
                              ? "heart.fill"
                              : "heart")

                            .font(.headline)

                            .foregroundStyle(
                                favoriteVM.isFavorite(category)
                                ? .red
                                : .white
                            )

                            .frame(width: 40, height: 40)

                            .background(.black.opacity(0.45))

                            .clipShape(Circle())

                    }

                }

                .padding([.top, .trailing], 16)

                Spacer()

                // MARK: Bottom Content

                HStack(spacing: 10) {

                    HStack(spacing: 4) {

                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)

                        Text("4.8")

                    }
                    .font(.caption.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())

                    HStack(spacing: 4) {

                        Image(systemName: "fork.knife")

                        Text("120 Recipes")

                    }
                    .font(.caption.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())

                }

                .padding(20)

            }

        }

        .frame(height: 240)

        .background(Color(.systemGray6).opacity(0.05))

        .clipShape(RoundedRectangle(cornerRadius: 26))

        .overlay {

            RoundedRectangle(cornerRadius: 26)
                .stroke(Color.white.opacity(0.08), lineWidth: 1)

        }

        .shadow(
            color: .black.opacity(0.45),
            radius: 18,
            x: 0,
            y: 12
        )

    }

}
