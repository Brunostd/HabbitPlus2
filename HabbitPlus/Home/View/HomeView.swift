//
//  HomeView.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 05/09/22.
//

import SwiftUI

struct HomeView: View{
    
    @ObservedObject var viewModel: HomeViewModel
    @State var date: Date = Date()
    @State var text = String()
    var bool = false
    
    var body: some View{
            VStack{
                Text(viewModel.stringDate)
                DatePicker("Selecione a reserva", selection: $date, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(.graphical)
                Button("Clique"){
                    viewModel.getStringDate(aux: date)
                }
            }
    }
}
