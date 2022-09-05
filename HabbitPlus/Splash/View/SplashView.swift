//
//  SplashView.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 23/08/22.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    @State var showAlert: Bool = false
    
    var body: some View{
        Group{
            switch viewModel.uiState {
            case .loading:
                loadingView()
            case .goToSignInScreen:
                viewModel.signInView()
            case .goToHomeScreen:
                Text("Tela principal")
            case .error(let string):
                loadingView(error: string)
            }
        }.onAppear(perform: {
            viewModel.onAppear()
        })
    }
}

/*
struct LoadingView: View{
    var body: some View{
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
        }
    }
}
 */

extension SplashView{
    func loadingView(error: String? = nil) -> some View{
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
            
            
            if let error = error{
                Text("")
                    .alert(isPresented: .constant(true)){
                        Alert(title: Text("Error"), message: Text(error), dismissButton: .default(Text("Ok")){
                            // faz algo quando some o alerta
                        })
                    }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(viewModel: SplashViewModel())
    }
}
