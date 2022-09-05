//
//  SignInUIState.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 03/09/22.
//

import Foundation

enum SignInUIState{
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
