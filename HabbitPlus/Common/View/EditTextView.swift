//
//  EditTextView.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 06/09/22.
//

import SwiftUI

struct EditTextView: View{
    
    @Binding var text: String
    var placeholder: String = ""
    var keyboard: UIKeyboardType = .default
    var error: String? = nil
    var failure: Bool? = nil
    var isSecure: Bool? = nil
    
    var body: some View{
        VStack{
            if isSecure == true{
                SecureField(placeholder, text: $text)
                    .foregroundColor(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            } else{
                TextField(placeholder, text: $text)
                    .foregroundColor(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            }
            
            if let error = error, failure == true, !text.isEmpty {
                Text(error).foregroundColor(Color.red)
            }
        }.padding(.bottom, 8)
    }
}

struct EditTextView_Previews: PreviewProvider{
    static var previews: some View{
        ForEach(ColorScheme.allCases, id: \.self) { value in
            VStack{
                EditTextView(
                    text: .constant(""),
                    placeholder: "E-mail",
                    keyboard: .default,
                    error: "campo invalido",
                    failure: "a@a.com".count < 3
                ).padding()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .preferredColorScheme(value)
        }
    }
}
