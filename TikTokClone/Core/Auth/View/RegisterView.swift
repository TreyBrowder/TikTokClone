//
//  RegisterView.swift
//  TikTokClone
//
//  Created by Trey Browder on 7/5/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var emailText = ""
    @State private var password = ""
    @State private var fullNameText = ""
    @State private var userNameText = ""
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var registerVM: RegisterViewModel
    
    private let authService: AuthService
    
    init(authService: AuthService){
        self.authService = authService
        
        self._registerVM = StateObject(wrappedValue: RegisterViewModel(authServices: authService))
    }
    
    var body: some View {
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
                TextField("Enter your email", text: $emailText)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter your full name", text: $fullNameText)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter Your username", text: $userNameText)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
            }
            
            
            //Sign up button
            Button {
                Task { await registerVM.createUser(withEmail: emailText,
                                                   password: password,
                                                   username: userNameText,
                                                   fullName: fullNameText)
                }
            } label: {
                Text("Sign Up")
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
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension RegisterView: AuthFormProtocol {
    var formIsValid: Bool {
        return !emailText.isEmpty
        && emailText.contains("@")
        && !password.isEmpty
        && !fullNameText.isEmpty
        && !userNameText.isEmpty
    }
}

#Preview {
    RegisterView(authService: AuthService())
}
