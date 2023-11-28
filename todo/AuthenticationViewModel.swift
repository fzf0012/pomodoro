//
//  AuthenticationViewModel.swift
//  todo
//
//  Created by Frank on 11/27/23.
//

import Foundation
import Firebase

class AuthenticationViewModel: ObservableObject {
    @Published var isAuthenticating = false
    @Published var authError: Error?
    @Published var isAuthenticated = false

    func signInWithEmail(email: String, password: String) {
        isAuthenticating = true
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isAuthenticating = false
                if let error = error {
                    self?.authError = error
                    return
                }
                self?.isAuthenticated = true
            }
        }
    }

    func registerWithEmail(email: String, password: String) {
        isAuthenticating = true
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isAuthenticating = false
                if let error = error {
                    print("Firebase Auth Error: \(error.localizedDescription)")
                    self?.authError = error
                    return
                }
                self?.isAuthenticated = true
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false
        } catch let signOutError {
            authError = signOutError
        }
    }
}
