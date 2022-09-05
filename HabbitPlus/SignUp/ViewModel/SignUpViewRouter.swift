//
//  SignUpViewRouter.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 05/09/22.
//

import SwiftUI

enum SignUpViewRouter{
    
    static func makeHomeView() -> some View{
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
    
}
