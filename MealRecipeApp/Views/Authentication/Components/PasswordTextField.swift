import SwiftUI

struct PasswordTextField: View {

    @Binding var password: String

    @State private var isSecure = true

    var body: some View {

        HStack(spacing: 15) {

            Image(systemName: "lock.fill")
                .foregroundColor(.gray)
                .frame(width: 22)

            if isSecure {

                SecureField(
                    "",
                    text: $password,
                    prompt: Text("Password")
                        .foregroundColor(.gray.opacity(0.7))
                )
                .foregroundColor(.black)

            } else {

                TextField(
                    "",
                    text: $password,
                    prompt: Text("Password")
                        .foregroundColor(.gray.opacity(0.7))
                )
                .foregroundColor(.black)

            }

            Button {

                isSecure.toggle()

            } label: {

                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundColor(.gray)

            }

        }
        .padding(.horizontal,20)
        .frame(height:60)
        .background(Color.white)
        .clipShape(Capsule())
        .shadow(color:.black.opacity(0.08), radius:18, x:0, y:8)

    }
}
