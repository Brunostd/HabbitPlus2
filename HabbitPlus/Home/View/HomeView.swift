//
//  HomeView.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 05/09/22.
//

import SwiftUI

struct HomeView: View{
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View{
        Text("Hello home page")
    }
}
