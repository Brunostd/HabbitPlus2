//
//  HabbitPlusApp.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 23/08/22.
//

import SwiftUI

@main
struct HabbitPlusApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
