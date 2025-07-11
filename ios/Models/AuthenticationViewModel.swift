//
//  AuthenticationViewModel.swift
//  ios
//
//  Created by Munkyu Yang on 7/10/25.
//

import Firebase
import FirebaseAuth
import Foundation
import GoogleSignIn

enum SignState {
    case signIn
    case signOut
}

class AuthenticationViewModel: ObservableObject {
    @Published var signState: SignState = .signOut

    // Google SignIn
    func signIn() {
        // 1
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn {
                [unowned self] user, error in
                if let user = user {
                    print("idToken: \(user.idToken?.tokenString)")
                    authenticateUser(for: user, with: error)
                }
            }
        } else {
            startSignIn()
        }
    }

    private func startSignIn() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController
        else {
            return
        }

        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [unowned self] result, error in
            if let user = result?.user {
                authenticateUser(for: user, with: error)
            }
        }
    }

    private func authenticateUser(for user: GIDGoogleUser, with error: Error?) {
        guard error == nil else {
            // ...
            return
        }

        guard let idToken = user.idToken?.tokenString
        else {
            // ...
            return
        }

        let accessToken = user.accessToken.tokenString

        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                       accessToken: accessToken)

        // ...

        Auth.auth().signIn(with: credential) {
            result, error in
            if let error = error {
                print("❌ Firebase 인증 실패: \(error.localizedDescription)")
            } else if let user = result?.user {
                self.signState = .signIn
                print("✅ Firebase 로그인 성공")

                // 아래처럼 각각 출력해보세요
                print("UID: \(user.uid)")
                print("이메일: \(user.email ?? "없음")")
                print("이름: \(user.displayName ?? "없음")")
                print("프로필 사진: \(user.photoURL?.absoluteString ?? "없음")")
                print("익명 사용자?: \(user.isAnonymous)")
                print("이메일 인증됨?: \(user.isEmailVerified)")
                print("idToken: \(idToken)")
            }
        }
    }
}
