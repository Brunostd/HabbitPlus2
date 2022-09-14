//
//  SignUpUIState.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 05/09/22.
//

import Foundation

enum SignUpUIState: Equatable{
    case none
    case loading
    case success
    case error(String)
}
