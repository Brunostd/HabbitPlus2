//
//  SignUpViewModel.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 05/09/22.
//

import Combine
import SwiftUI

class SignUpViewModel: ObservableObject{
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var birthday: String = ""
    @Published var document: String = ""
    @Published var phone: String = ""
    @Published var gender: Gender = .male
    
    @Published var uiState: SignUpUIState = .none
    
    func signUp(){
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            //self.uiState = .goToSignInScreen
            self.uiState = .success
            //self.uiState = .error("senha fraca")
            self.publisher.send(true)
        })
    }
    
}
extension SignUpViewModel{
    func homeView() -> some View{
        return SignUpViewRouter.makeHomeView()
    }
}
