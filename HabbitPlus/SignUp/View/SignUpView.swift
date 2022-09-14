//
//  SignUpView.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 05/09/22.
//

import SwiftUI

struct SignUpView: View{
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View{
        ZStack{
            ScrollView(showsIndicators: false, content: {
                VStack(alignment: .center){
                    VStack(alignment: .leading, spacing: 8){
                        
                        Text("Cadastro")
                            .foregroundColor(Color("textColor"))
                            .font(Font.title.bold())
                            .padding(.bottom, 8)
                        
                        fullNameField
                        
                        emailField
                        
                        passwordField
                        
                        birthDayField
                        
                        documentField
                        
                        phoneField
                        
                        genderField
                        
                        registerButton
                    }
                    Spacer()
                }
            }).padding(.horizontal, 20)
            
            if case SignUpUIState.error(let value) = viewModel.uiState{
                Text("")
                    .alert(isPresented: .constant(true)){
                    Alert(title: Text("Error"), message: Text(value), dismissButton: .default(Text("Ok")){
                        // faz algo quando some o alerta
                    })
                }
            }
        }
    }
}

extension SignUpView{
    var fullNameField: some View{
        EditTextView(
            text: $viewModel.fullName,
            placeholder: "Digite o nome completo",
            keyboard: .default,
            error: "Digite mais de tres caracteres",
            failure: (viewModel.fullName.count < 3),
            isSecure: false
        )
    }
}

extension SignUpView{
    var emailField: some View{
        EditTextView(
            text: $viewModel.email,
            placeholder: "Digite um e-mail",
            keyboard: .default,
            error: "Digite um email valido",
            failure: !viewModel.email.isEmail(),
            isSecure: false
        )
    }
}

extension SignUpView{
    var passwordField: some View{
        EditTextView(
            text: $viewModel.password,
            placeholder: "Digite uma senha",
            keyboard: .default,
            error: "Digite 6 ou mais caracteres",
            failure: (viewModel.password.count < 6),
            isSecure: true
        )
    }
}

extension SignUpView{
    var birthDayField: some View{
        EditTextView(
            text: $viewModel.birthday,
            placeholder: "Digite a sua data de nascimento",
            keyboard: .default,
            error: "Digite no formato dd/MM/yy",
            failure: (viewModel.birthday.count != 10),
            isSecure: false
        )
    }
}

extension SignUpView{
    var documentField: some View{
        EditTextView(
            text: $viewModel.document,
            placeholder: "Digite o cpf",
            keyboard: .default,
            error: "Digite um documento valido",
            failure: (viewModel.document.count != 11),
            isSecure: false
        )
    }
}

extension SignUpView{
    var phoneField: some View{
        EditTextView(
            text: $viewModel.phone,
            placeholder: "Digite um numero de telefone",
            keyboard: .default,
            error: "Digite um numero de telefone com DD ou sem",
            failure: (viewModel.phone.count < 10 || viewModel.phone.count >= 12),
            isSecure: false
        )
    }
}

extension SignUpView{
    var genderField: some View{
        Picker("Gender", selection: $viewModel.gender){
            ForEach(Gender.allCases, id: \.self){ value in
                Text(value.rawValue)
                    .tag(value)
            }
        }.pickerStyle(.segmented)
            .padding(.top, 8)
            .padding(.bottom, 8)
    }
}

extension SignUpView{
    var registerButton: some View{
        LoadingButtonView(
            action: {
                viewModel.signUp()
            },
            text: "Realizar cadastro",
            showProgressBar: self.viewModel.uiState == SignUpUIState.loading,
            disable: !viewModel.email.isEmail() ||
            (viewModel.fullName.count < 3) ||
            (viewModel.password.count < 6) ||
            (viewModel.birthday.count != 10) ||
            (viewModel.document.count != 11) ||
            (viewModel.phone.count < 10 || viewModel.phone.count >= 12)
        )
    }
}

struct SignUp_Previews: PreviewProvider{
    static var previews: some View{
        ForEach(ColorScheme.allCases, id: \.self) { value in
            VStack{
                SignUpView(viewModel: SignUpViewModel())
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .preferredColorScheme(value)
        }
    }
}
