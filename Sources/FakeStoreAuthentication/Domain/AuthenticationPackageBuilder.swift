//
//  AuthenticationPackageBuilder.swift
//  
//
//  Created by Andres Duque on 29/05/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

public struct AuthenticationPackageBuilder: BasePackageBuilderProtocol {
    public init() {}
    
    public func start() {
        let injector = Injector.global
        
        // Router
        injector.add(RouterEventPool.self, key: AuthenticationRouterEventPool.name, implementation: AuthenticationRouterEventPool.instance)

        // Repositories
        injector.register(AuthRepositoryProtocol.self, implementation: AuthRepositoryImpl.instance)
        injector.register(UsersRepositoryProtocol.self, implementation: UsersRepositoryImpl.instance)
        
        // Use Cases
        injector.register(LoginUseCaseProtocol.self, implementation: LoginUseCaseImpl.instance)
        injector.register(SaveUserUseCaseProtocol.self, implementation: SaveUserUseCaseImpl.instance)
        injector.register(GetUserDataUseCaseProtocol.self, implementation: GetUserDataUseCaseImpl.instance)
        injector.register(GetAuthenticationStateUseCaseProtocol.self, implementation: GetAuthenticationStateUseCaseImpl.instance)
        injector.register(SaveUserUseCaseProtocol.self, implementation: SaveUserUseCaseImpl.instance)
        injector.register(GetUserUseCaseProtocol.self, implementation: GetUserUseCaseImpl.instance)
        injector.register(LogOutUseCaseProtocol.self, implementation: LogOutUseCaseImpl.instance)
        
        // Mappers
        injector.register(UserResponseToUserMapperProtocol.self, implementation: UserResponseToUserMapperImpl.instance)
    }
}
