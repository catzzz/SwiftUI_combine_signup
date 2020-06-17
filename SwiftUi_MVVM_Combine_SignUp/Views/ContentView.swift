//
//  ContentView.swift
//  SwiftUi_MVVM_Combine_SignUp
//
//  Created by Jimmy Leu on 2020/6/16.
//  Copyright © 2020 Jimmy Leu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userViewModel = UserViewModel()
    
    @State var presentAlert = false
    
    var body: some View {
        Form{
           Section(footer: Text(userViewModel.usernameMessage).foregroundColor(.red)){
                TextField("Username", text: $userViewModel.username)
                    .autocapitalization(.none)
             }
            Section(footer: Text(userViewModel.passwordMessage).foregroundColor(.red)) {
               SecureField("Password", text: $userViewModel.password)
               SecureField("Password again", text: $userViewModel.passwordAgain)
            }
            Section {
                Button(action: {
                    self.signUp()
                }) {
                    Text("Sign up")
                }.disabled(!userViewModel.isValid)
            }
           
        }
        .sheet(isPresented: $presentAlert) {
          WelcomeView()
        }
    }
    
    func signUp() {
      self.presentAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WelcomeView: View {
  var body: some View {
    Text("Welcome! Great to have you on board!")
  }
}
