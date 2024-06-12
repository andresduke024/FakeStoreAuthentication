//
//  LoginTitles.swift
//  
//
//  Created by Andres Duque on 6/06/24.
//

import SwiftUI
import FakeStoreCommons

struct LoginTitles: View {
    var body: some View {
        VStack {
            Title(text: Constants.Titles.welcome)

            Caption(text: Constants.Titles.loginWelcome)
        }
        .padding(.bottom, 60)
    }
}

#Preview {
    LoginTitles()
}
