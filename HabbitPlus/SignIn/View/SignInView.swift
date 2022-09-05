//
//  SignInView.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 24/08/22.
//

import SwiftUI

struct SignInView: View{
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email = ""
    @State var password = ""
    
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
                        .background(Color.white)
                        .navigationBarTitle("Login", displayMode: .inline)
                        .navigationBarHidden(navigationHidden)
                }
            }
        }
    }
}

extension SignInView{
    var emailField: some View{
        TextField("", text: $email)
            .border(.black)
    }
}

extension SignInView{
    var passwordField: some View{
        SecureField("", text: $password)
            .border(.orange)
    }
}

extension SignInView{
    var entrarButton: some View{
        Button("Entrar"){
            // acao do button
            viewModel.login(email: email, password: password)
        }
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
