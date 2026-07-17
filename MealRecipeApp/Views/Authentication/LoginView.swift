//
//
//import SwiftUI
//import Combine
//
//struct LoginView: View {
//
//    @EnvironmentObject
//    private var appState: AppState
//
//    @StateObject
//    private var viewModel = LoginViewModel()
//
//    var body: some View {
//
//        ZStack {
//
//            AuthBackground()
//
//            VStack(spacing: 0) {
//
//                VStack(spacing: 8) {
//
//                    Text("Hello")
//                        .font(.system(size: 52, weight: .bold))
//                        .foregroundColor(.black)
//
//                    Text("Sign in to your account")
//                        .font(.title3)
//                        .foregroundColor(.gray)
//
//                }
//                .padding(.top, 160)
//
//                .onChange(of: viewModel.didLogin) { _, didLogin in
//                    if didLogin {
//                        appState.route = .home
//                    }
//                }
//                VStack(spacing: 18) {
//
//                    AuthTextField(
//                        icon: "person.fill",
//                        placeholder: "Email",
//                        text: $viewModel.email
//                    )
//
//                    PasswordTextField(
//                        password: $viewModel.password
//                    )
//
//                }
//                .padding(.top, 45)
//                .padding(.horizontal, 35)
//
//                HStack {
//
//                    Spacer()
//
//                    Button("Forgot your password?") {
//                        viewModel.forgotPassword()
//                    }
//                    .font(.footnote)
//                    .foregroundColor(.gray)
//
//                }
//                .padding(.horizontal, 35)
//                .padding(.top, 12)
//
//                Spacer()
//
//                HStack(spacing: 20) {
//
//                    Text("Sign in")
//                        .font(.system(size: 24, weight: .bold))
//                        .foregroundColor(.black)
//
//                    GradientButton {
//                        viewModel.login()
//                    }
//
//                }
//
//                Spacer()
//                Spacer()
//
//                HStack(spacing: 5) {
//
//                    Text("Don't have an account?")
//                        .foregroundColor(.black)
//
//                    Button("Create") {
//                        appState.route = .register
//                    }
//                    .underline()
//                    .foregroundColor(.black)
//
//                }
//                .padding(.bottom, 40)
//
//            }
//            .ignoresSafeArea(edges: .top)
//
//        }
//
//    }
//
//}

//
//  LoginView.swift
//  MealRecipeApp
//

//
//  LoginView.swift
//  MealRecipeApp
//

import SwiftUI
import Combine

struct LoginView: View {

    @EnvironmentObject
    private var appState: AppState

    @StateObject
    private var viewModel = LoginViewModel()

    var body: some View {

        ZStack {

            Color.black
                .ignoresSafeArea()

            VStack(spacing: 0) {

                Spacer()

                // MARK: Logo

                Image(systemName: "fork.knife.circle.fill")
                    .font(.system(size: 85))
                    .foregroundStyle(.orange)

                // MARK: App Name

                Text("MealMaster")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.top, 15)

                Text("Welcome Back")
                    .font(.system(size: 42, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.top, 25)

                Text("Sign in to continue discovering\namazing recipes.")
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)

                VStack(spacing: 20) {

                    AuthTextField(
                        icon: "envelope.fill",
                        placeholder: "Email",
                        text: $viewModel.email
                    )

                    PasswordTextField(
                        password: $viewModel.password
                    )

                }
                .padding(.horizontal, 30)
                .padding(.top, 55)

                HStack {

                    Spacer()

                    Button {

                        viewModel.forgotPassword()

                    } label: {

                        Text("Forgot Password?")
                            .fontWeight(.medium)
                            .foregroundStyle(.orange)

                    }

                }
                .padding(.horizontal, 32)
                .padding(.top, 15)

                if let error = viewModel.errorMessage {

                    Text(error)
                        .foregroundColor(.red)
                        .padding(.top, 15)

                }

                Spacer()

                Button {

                    viewModel.login()

                } label: {

                    HStack {

                        Text("Sign In")
                            .font(.headline)

                        Spacer()

                        Image(systemName: "arrow.right")
                            .font(.headline)

                    }
                    .foregroundStyle(.white)
                    .padding()
                    .frame(height: 60)
                    .background(

                        LinearGradient(
                            colors: [
                                .orange,
                                Color.orange.opacity(0.75)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )

                    )
                    .clipShape(RoundedRectangle(cornerRadius: 18))

                }
                .padding(.horizontal, 30)




                Spacer()

                HStack(spacing: 6) {

                    Text("Don't have an account?")
                        .foregroundStyle(.gray)

                    Button {

                        appState.route = .register

                    } label: {

                        Text("Create Account")
                            .fontWeight(.bold)
                            .foregroundStyle(.orange)

                    }

                }
                .padding(.bottom, 35)

            }
            .onChange(of: viewModel.didLogin) { _, value in
                if value {
                    appState.route = .home
                }
            }

        }

    }

}

#Preview {
    LoginView()
        .environmentObject(AppState())
}
