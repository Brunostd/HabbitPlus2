//
//  LoadingButtonView.swift
//  HabbitPlus
//
//  Created by Bruno Brito on 06/09/22.
//

import SwiftUI

struct LoadingButtonView: View{
    
    var action: () -> Void
    var text: String
    var showProgressBar: Bool = false
    var disable: Bool = false
    
    
    var body: some View{
        ZStack{
            Button(action: { action()}, label: {
                Text(showProgressBar ? " " : text)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 16)
                    .font(Font.title3.bold())
                    .background(disable ? Color("ligthOrange") : Color.orange)
                    .foregroundColor(Color.white)
                    .cornerRadius(4.0)
            }).disabled(disable || showProgressBar)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgressBar ? 1 : 0)
            
        }.padding(.horizontal, 8)
    }
    
}

struct LoadingButtonView_Previews: PreviewProvider{
    static var previews: some View{
        LoadingButtonView(action: {
            print("Ola")
        },
        text: "Entrar",
        showProgressBar: true,
        disable: false
        )
    }
}
