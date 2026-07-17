import SwiftUI

struct AuthTextField: View {

    let icon: String
    let placeholder: String

    @Binding var text: String

    var body: some View {

        HStack(spacing: 15) {

            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.gray)
                .frame(width: 22)

            TextField("", text: $text, prompt: Text(placeholder).foregroundColor(.gray.opacity(0.7)))
                .foregroundColor(.black)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

        }
        .padding(.horizontal, 20)
        .frame(height: 60)
        .background(Color.white)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.08), radius: 18, x: 0, y: 8)

    }
}
