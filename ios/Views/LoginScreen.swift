//
//  LoginScreen.swift
//  ios
//
//  Created by Munkyu Yang on 7/4/25.
//

import GoogleSignIn
import SwiftUI

struct LoginScreen: View {
    @StateObject private var authenticationViewModel = AuthenticationViewModel()

    var body: some View {
        VStack {
            Text("Log in screen")
            Button {
                handleSignup()
            } label: {
                Text("Login with Google")
            }
        }
        .padding(.vertical, 80)
    }

    func handleSignup() {
        authenticationViewModel.signIn()
    }
}

#Preview {
    LoginScreen()
}
