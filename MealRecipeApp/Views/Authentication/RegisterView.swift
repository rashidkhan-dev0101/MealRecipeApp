//import SwiftUI
//import Combine
//
//struct RegisterView: View {
//
//    @EnvironmentObject
//    private var appState: AppState
//
//    @StateObject
//    private var viewModel = RegisterViewModel()
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
//                    Text("Create Account")
//                        .font(.system(size: 44, weight: .bold))
//                        .foregroundColor(.black)
//
//                    Text("Sign up to get started")
//                        .font(.title3)
//                        .foregroundColor(.gray)
//                    
//
//                }
//                .padding(.top, 160)
//                
//                .onChange(of: viewModel.didRegister) { _, didRegister in
//                    if didRegister {
//                        appState.route = .home
//                    }
//                }
//
//                VStack(spacing: 18) {
//                    
//                    AuthTextField(
//                          icon: "person.fill",
//                          placeholder: "Username",
//                          text: $viewModel.username
//                      )
//
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
//                    PasswordTextField(
//                        password: $viewModel.confirmPassword
//                    )
//
//                }
//                .padding(.top, 45)
//                .padding(.horizontal, 35)
//
//                if let errorMessage = viewModel.errorMessage {
//
//                    Text(errorMessage)
//                        .font(.footnote)
//                        .foregroundColor(.red)
//                        .padding(.horizontal, 35)
//                        .padding(.top, 12)
//
//                }
//
//                Spacer()
//
//                
//                VStack(spacing: 25) {
//
//                    HStack(spacing: 20) {
//
//                        Text("Sign up")
//                            .font(.system(size: 24, weight: .bold))
//
//                        GradientButton {
//                            viewModel.createAccount()
//                        }
//                    }
//
//                    Text("Or continue with")
//                        .font(.system(size: 18))
//                        .foregroundStyle(.gray)
//
//                    Button {
//                        Task {
//                            await viewModel.signInWithGoogle()
//                        }
//                    } label: {
//
//                        Image("google")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 28, height: 28)
//                            .frame(width: 60, height: 60)
//                            .background(Color.white)
//                            .clipShape(Circle())
//                            .shadow(color: .black.opacity(0.15),
//                                    radius: 10,
//                                    x: 0,
//                                    y: 5)
//
//                    }
//
//                }
////                HStack(spacing: 20) {
////
////                    Text("Sign up")
////                        .font(.system(size: 24, weight: .bold))
////                        .foregroundColor(.black)
////
////                    GradientButton {
////                        viewModel.createAccount()
////                    }
////
////                }
//
//                Spacer()
//                Spacer()
//
//                HStack(spacing: 5) {
//
//                    Text("Already have an account?")
//                        .foregroundColor(.black)
//
//                    Button("Sign in") {
//                        appState.route = .login
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
//  RegisterView.swift
//  MealRecipeApp
//

import SwiftUI
import Combine

struct RegisterView: View {

    @EnvironmentObject
    private var appState: AppState

    @StateObject
    private var viewModel = RegisterViewModel()

    var body: some View {

        ZStack {

            Color.black
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 0) {

                    // MARK: Logo

                    Image(systemName: "fork.knife.circle.fill")
                        .font(.system(size: 82))
                        .foregroundStyle(.orange)
                        .padding(.top, 70)

                    Text("Create Account")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.top, 22)

                    Text("Join MealMaster and start cooking\namazing recipes today.")
                        .font(.title3)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top, 8)

                    VStack(spacing: 20) {

                        AuthTextField(
                            icon: "person.fill",
                            placeholder: "Username",
                            text: $viewModel.username
                        )

                        AuthTextField(
                            icon: "envelope.fill",
                            placeholder: "Email",
                            text: $viewModel.email
                        )

                        PasswordTextField(password: $viewModel.password)

                        PasswordTextField(password: $viewModel.confirmPassword)

                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 40)

                    if let error = viewModel.errorMessage {

                        Text(error)
                            .foregroundStyle(.red)
                            .font(.footnote)
                            .padding(.top, 15)

                    }

                    Button {

                        viewModel.createAccount()

                    } label: {

                        HStack {

                            Text("Create Account")
                                .font(.headline)

                            Spacer()

                            Image(systemName: "arrow.right")

                        }
                        .foregroundStyle(.white)
                        .padding()
                        .frame(height: 60)
                        .background(
                            LinearGradient(
                                colors: [.orange, .pink],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 18))

                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 35)

                    HStack {

                        Rectangle()
                            .fill(Color.white.opacity(0.15))
                            .frame(height: 1)

                        Text("OR")
                            .foregroundStyle(.gray)

                        Rectangle()
                            .fill(Color.white.opacity(0.15))
                            .frame(height: 1)

                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 25)

                    Button {

                        Task {
                            await viewModel.signInWithGoogle()
                        }

                    } label: {

                        HStack(spacing: 12) {

                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22)

                            Text("Continue with Google")
                                .fontWeight(.semibold)

                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 58)
                        .background(Color.white.opacity(0.08))
                        .clipShape(RoundedRectangle(cornerRadius: 18))

                    }
                    .padding(.horizontal, 30)

                    HStack(spacing: 5) {

                        Text("Already have an account?")
                            .foregroundStyle(.gray)

                        Button("Sign In") {
                            appState.route = .login
                        }
                        .foregroundStyle(.orange)

                    }
                    .padding(.top, 35)
                    .padding(.bottom, 40)

                }

            }
            .onChange(of: viewModel.didRegister) { _, value in

                if value {

                    appState.route = .home

                }

            }

        }

    }

}

#Preview {

    RegisterView()
        .environmentObject(AppState())

}
