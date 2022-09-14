//
//  SignInView.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 24/08/22.
//

import SwiftUI

struct SignInView: View{
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var action: Int? = 0
    @State var navigationHidden = true
    
    var body: some View{
        
        ZStack{
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            } else{
                NavigationView{
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .center, spacing: 20){
                            
                            Spacer(minLength: 36)
                            
                            VStack(alignment: .center, spacing: 8){
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 48)
                                
                                Text("Login")
                                    .foregroundColor(.orange)
                                    .font(Font.system(.title).bold())
                                    .padding(.bottom, 8)
                                
                                emailField
                                
                                passwordField
                                
                                entrarButton
                                
                                registerLink
                                
                                Text("Copyright @YYY")
                                    .foregroundColor(Color.gray)
                                    .font(Font.system(size: 16).bold())
                                    .padding(.top, 16)
                                
                            }
                        }
                        
                        if case SignInUIState.error(let value) = viewModel.uiState{
                            Text("")
                                .alert(isPresented: .constant(true)){
                                Alert(title: Text("Error"), message: Text(value), dismissButton: .default(Text("Ok")){
                                    // faz algo quando some o alerta
                                })
                            }
                        }
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 32)
                        .navigationBarTitle("Login", displayMode: .inline)
                        .navigationBarHidden(navigationHidden)
                }
            }
        }
    }
}

extension SignInView{
    var emailField: some View{
        EditTextView(
            text: $viewModel.email,
            placeholder: "email",
            keyboard: .emailAddress,
            error: "campo invalido",
            failure: !viewModel.email.isEmail(),
            isSecure: false
        )
    }
}

extension SignInView{
    var passwordField: some View{
        EditTextView(
            text: $viewModel.password,
            placeholder: "senha",
            keyboard: .default,
            error: "senha fraca",
            failure: viewModel.password.count < 5,
            isSecure: true
        )
    }
}

extension SignInView{
    var entrarButton: some View{
        LoadingButtonView(
            action: {
                viewModel.login()
            },
            text: "Entrar",
            showProgressBar: self.viewModel.uiState == SignInUIState.loading,
            disable: !viewModel.email.isEmail() || viewModel.password.count < 5
        )
    }
}

extension SignInView{
    var registerLink: some View{
        VStack{
            Text("Ainda nao possui login ativo ?")
                .foregroundColor(.gray)
                .padding(.top, 48)
            
            ZStack{
                NavigationLink(
                    destination: viewModel.signUpView(),
                    tag: 1,
                    selection: $action,
                    label: {EmptyView()}
                )
                Button("Realizar cadastro"){
                    self.action = 1
                }
            }
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel())
    }
}
