//
//  LoginView.swift
//  todo
//
//  Created by Frank on 11/27/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if authViewModel.isAuthenticating {
                ProgressView()
            } else {
                Button("Sign In") {
                    authViewModel.signInWithEmail(email: email, password: password)
                }
                .padding()

                Button("Register") {
                    if password.count >= 6 {
                        authViewModel.registerWithEmail(email: email, password: password)
                    } else {
                        print("Password must be at least 6 characters long")
                    }
                }
                .padding()
            }

            if let error = authViewModel.authError {
                Text("Error: \(error.localizedDescription)")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
