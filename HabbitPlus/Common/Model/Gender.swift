//
//  Gender.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 05/09/22.
//

import SwiftUI

enum Gender: String, CaseIterable, Identifiable{
    case male = "Masculino"
    case female = "Feminino"
    
    var id: String{
        self.rawValue
    }
}
