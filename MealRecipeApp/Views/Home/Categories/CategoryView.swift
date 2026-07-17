
import SwiftUI

struct CategoryView: View {

    @StateObject
    private var viewModel = CategoryViewModel()

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: 24) {

                // MARK: Header

                VStack(alignment: .leading, spacing: 8) {

                    Text("Categories")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)

                    Text("Discover delicious recipes from around the world.")
                        .font(.subheadline)
                        .foregroundStyle(.gray)

                }

                // MARK: Search

                HStack(spacing: 12) {

                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)

                    TextField("Search categories...", text: $viewModel.searchText)
                        .foregroundStyle(.white)

                }
                .padding()
                .background(Color.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 18))

                // MARK: Loading

                if viewModel.isLoading {

                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding(.top, 60)

                } else {

                    LazyVStack(spacing: 20) {

                        ForEach(viewModel.filteredCategories) { category in

//                            NavigationLink {
//
//                                CategoryMealsView(category: category)
//
//                            } label: {
//
//                                CategoryCard(category: category)
//
//                            }
//
//                            .buttonStyle(.plain)
                            NavigationLink {

                                CategoryDetailView(category: category)

                            } label: {

                                CategoryCard(category: category)

                            }
                            .buttonStyle(.plain)

                        }

                    }

                }

            }
            .padding()

        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .task {

            viewModel.fetchCategories()

        }

    }

}

#Preview {

    NavigationStack {

        CategoryView()

    }

}
