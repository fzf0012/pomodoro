//
//  ContentView.swift
//  todo
//
//  Created by Frank on 11/27/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @StateObject var todoListViewModel = TodoListViewModel()  // Create a TodoListViewModel instance

    var body: some View {
        if authViewModel.isAuthenticated {
            DashboardView()
                .environmentObject(todoListViewModel)  // Pass TodoListViewModel as an EnvironmentObject
        } else {
            LoginView()
        }
    }
}


