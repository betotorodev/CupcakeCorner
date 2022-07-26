//
//  DisabledView.swift
//  CupcakeCorner
//
//  Created by Beto Toro on 22/07/22.
//

import SwiftUI

struct DisabledView: View {
  @State private var username = ""
  @State private var email = ""
  var disableForm: Bool {
    username.count < 5 || email.count < 5
  }
  
  var body: some View {
    Form {
      Section {
        TextField("Username", text: $username)
        TextField("Email", text: $email)
      }
      
      Section {
        Button("Create account") {
          print("Creating account…")
        }
      }
      .disabled(disableForm)
      
    }
  }
}

struct DisabledView_Previews: PreviewProvider {
  static var previews: some View {
    DisabledView()
  }
}
