//
//  LoginView.swift
//
//
//  Created by Andres Duque on 29/05/24.
//

import SwiftUI
import FakeStoreCommons
import SwiftDependencyInjector

struct LoginView: View {
    
    @Injectable
    private var theme: Theme?
    
    @StateObject
    private var observableObject = LoginObservableObject()
    
    var body: some View {
        ModalPresenterWrapper(modals: $observableObject.modals) {
            PrimaryBackground {
                VStack {
                    
                    LoginTitles()
                    
                    VStack(alignment: .center) {
                        
                        LoginInputs(
                            username: $observableObject.username,
                            password: $observableObject.password
                        )
                        .padding(.bottom, 30)
                        
                        AppButton(
                            isLoading: $observableObject.isLoading,
                            text: Constants.Texts.login,
                            action: {
                                Task { await observableObject.performLogin() }
                            }
                        )
                        .padding(.horizontal, 40)
                        
                    }
                    .padding(20)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
