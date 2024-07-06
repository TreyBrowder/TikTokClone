//
//  LoginView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/5/24.
//

import SwiftUI

struct LoginView: View {
    @State private var emailText = ""
    @State private var password = ""
    @StateObject private var loginVM: LoginViewModel
    
    private var authService: AuthService
    init(authService: AuthService){
        self.authService = authService
        
        let vm = LoginViewModel(authService: authService)
        self._loginVM = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                //Logo
                Image("tik-tok-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                //text fields
                VStack {
                    TextField("Enter Your Email", text: $emailText)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextFieldModifier())
                    
                    SecureField("Enter Your Password", text: $password)
                        .modifier(StandardTextFieldModifier())
                }
                
                NavigationLink {
                Text("Forgot password")
                } label: {
                    Text("Forgot Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                //login button
                Button {
                    Task { await loginVM.login(withEmail: emailText, password: password) }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.vertical)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.6)
                
                Spacer()
                
                //go to sign up
                Divider()
                
                NavigationLink {
                    RegisterView(authService: authService)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.vertical)
                }
            }
        }
    }
}

//MARK: - AUTH FORM PROTOCOL
extension LoginView: AuthFormProtocol {
    var formIsValid: Bool {
        return !emailText.isEmpty
        && emailText.contains("@")
        && !password.isEmpty
    }
}

#Preview {
    LoginView(authService: AuthService())
}
