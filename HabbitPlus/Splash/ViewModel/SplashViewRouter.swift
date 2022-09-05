//
//  SplashViewRouter.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 24/08/22.
//

import SwiftUI

enum SplashViewRouter{
    
    static func makeSignInView () -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
}
