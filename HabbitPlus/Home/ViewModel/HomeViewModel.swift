//
//  HomeViewModel.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 05/09/22.
//

import SwiftUI
import Foundation

class HomeViewModel: ObservableObject{
    
    @Published var stringDate = String()
    private var dateFormatter = DateFormatter()
    
    init(){
        self.stringDate = "teste"
    }
    
    func getStringDate(aux: Date) -> Bool{
        dateFormatter.dateFormat = "YY/MM/dd"
        self.stringDate = dateFormatter.string(from: aux)
        return true
    }
    
}
