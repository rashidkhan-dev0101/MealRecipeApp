//
//  SearchBar.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//
import SwiftUI

struct SearchBar: View {

    @Binding var text: String
    var onSearch: (() -> Void)? = nil

    var body: some View {

        HStack(spacing: 12) {

            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)

            TextField("Search recipes...", text: $text)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .onChange(of: text) { _, _ in
                    onSearch?()
                }

            if !text.isEmpty {

                Button {

                    text = ""
                    onSearch?()

                } label: {

                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.gray)

                }

            }

        }
        .padding(.horizontal, 18)
        .frame(height: 58)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}
