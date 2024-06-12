//
//  LoginInputs.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import SwiftUI
import FakeStoreCommons

struct LoginInputs: View {
    
    @Binding
    var username: FieldContentWrapper
    
    @Binding
    var password: FieldContentWrapper
    
    var body: some View {
        VStack(spacing: 12) {
            AppTextField(
                contentWrapper: $username,
                image: Images.Icons.person,
                placeHolder: "username"
            )
            
            AppSecureTextField(
                contentWrapper: $password,
                image: Images.Icons.lock,
                placeHolder: "password"
            )
        }
    }
}

#Preview {
    LoginInputs(
        username: .constant(FieldContentWrapper.build(initialValue: "test@test.com")),
        password: .constant(FieldContentWrapper.build(initialValue: "1234567"))
    )
}
