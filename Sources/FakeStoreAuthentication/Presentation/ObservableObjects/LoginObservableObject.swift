//
//  LoginObservableObject.swift
//
//
//  Created by Andres Duque on 29/05/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

class LoginObservableObject: BaseObservableObject {
    
    @Injectable(injection: .singleton, constrainedTo: AuthenticationRouterEventPool.name)
    private var routerEventPool: RouterEventPool?
    
    @Injectable
    private var loginUseCase: LoginUseCaseProtocol?
    
    @Injectable
    private var getUserDataUseCase: GetUserDataUseCaseProtocol?
    
    @Injectable
    private var saveUserUseCase: SaveUserUseCaseProtocol?
    
    @Published
    var username = FieldContentWrapper.build(rules: [.notEmpty])
    
    @Published
    var password = FieldContentWrapper.build(rules: [.notEmpty])
    
    @Published
    var isLoading: Bool = false
    
    func performLogin() async {
        guard await validateFields() else { return }
        
        do {
            await loading(true)
            try await login()
            await loading(false)
            
            await navigateToHome()
        } catch {
            await onLoginError()
        }
    }
    
    private func validateFields() async -> Bool {
        let isValidUsername = await username.validate()
        let isValidPassword = await password.validate()
        
        return isValidUsername && isValidPassword
    }
    
    private func login() async throws {
        guard let loginUseCase, let getUserDataUseCase, let saveUserUseCase else { return }
        
        let request = LoginRequest(
            username: username.content.lowercased(),
            password: password.content
        )
        
        let token = try await loginUseCase.invoke(request)
        let user = try await getUserDataUseCase.invoke(username.content, token)
        
        try await saveUserUseCase.invoke(user)
    }
    
    private func navigateToHome() async {
        let event: RouterEvent = .replaceStack(.home)
        await routerEventPool?.emit(event)
    }
    
    private func onLoginError() async {
        await loading(false)
        
        let action = ModalAction(name: CommonConstants.Texts.tryAgain)
        
        let modal = Modal(
            type: .error,
            title: CommonConstants.Titles.genericError,
            description: Constants.Errors.login,
            actions: [action]
        )
        
        await addModal(modal)
    }
    
    @MainActor
    private func loading(_ newValue: Bool) {
        self.isLoading = newValue
    }
}
