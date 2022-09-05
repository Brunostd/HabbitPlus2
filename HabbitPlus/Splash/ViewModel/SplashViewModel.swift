//
//  SplashViewModel.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 24/08/22.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            //self.uiState = .goToSignInScreen
            self.uiState = .goToSignInScreen
        })
    }
}

extension SplashViewModel{
    func signInView() -> some View{
        return SplashViewRouter.makeSignInView()
    }
}
