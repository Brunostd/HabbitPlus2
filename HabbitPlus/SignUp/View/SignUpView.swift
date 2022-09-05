//
//  SignUpView.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 05/09/22.
//

import SwiftUI

struct SignUpView: View{
    
    @ObservedObject var viewModel: SignUpViewModel
    
    @State var fullName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var birthday: String = ""
    @State var document: String = ""
    @State var phone: String = ""
    @State var gender: Gender = .male
    
    var body: some View{
        ZStack{
            ScrollView(showsIndicators: false, content: {
                VStack(alignment: .center){
                    VStack(alignment: .leading, spacing: 8){
                        
                        Text("Cadastro")
                            .foregroundColor(Color.black)
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
        TextField("", text: $fullName)
            .border(.black)
    }
}

extension SignUpView{
    var emailField: some View{
        TextField("", text: $email)
            .border(.black)
    }
}

extension SignUpView{
    var passwordField: some View{
        SecureField("", text: $password)
            .border(.orange)
    }
}

extension SignUpView{
    var birthDayField: some View{
        TextField("", text: $birthday)
            .border(.black)
    }
}

extension SignUpView{
    var documentField: some View{
        TextField("", text: $document)
            .border(.black)
    }
}

extension SignUpView{
    var phoneField: some View{
        TextField("", text: $phone)
            .border(.black)
    }
}

extension SignUpView{
    var genderField: some View{
        Picker("Gender", selection: $gender){
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
        Button("Realizar cadastro"){
            // acao do button
            viewModel.signUp()
        }
    }
}
