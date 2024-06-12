//
//  AuthenticationModuleView.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import SwiftUI
import FakeStoreCommons
import SwiftDependencyInjector

public struct AuthenticationModuleView: View {
    
    @Inject(injection: .singleton, constrainedTo: AuthenticationRouterEventPool.name)
    private var routerEventPool: RouterEventPool
    
    public init() {}
    
    public var body: some View {
        BaseNavigationView(routerEventPool: routerEventPool) {
            LoginView()
        }
    }
}


#Preview {
    AuthenticationModuleView()
}
