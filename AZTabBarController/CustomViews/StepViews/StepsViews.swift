//
//  StepsViews.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 21/02/2023.
//

import SwiftUI

//-------------------
struct StepsViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StepsViews_Previews: PreviewProvider {
    static var previews: some View {
        StepsViews()
    }
}
//-----------------------------------

//-----------------------------

struct StepCircleButton: View {
    
    @State var buttonColor : UIColor
    var number : Int
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            Circle()
                .foregroundColor(Color(uiColor: buttonColor))
                .frame(width: 30, height: 30)
            Text("\(number)")
                .foregroundColor(.white)
                .bold()
        }
    }
    
    func editColor(color : UIColor) {
        self.buttonColor = color
    }
}

struct StepCircleButton_Preview: PreviewProvider {
    static var previews: some View {
        StepCircleButton(buttonColor: .systemGray2, number: 1)
            .previewLayout(.sizeThatFits)
    }
}

//----------------------------

//-----------------------------

struct FieldForm: View {
    
    var placeHolder : String
    @State var value : String
    
    var body: some View {
        
        TextField(placeHolder, text: $value)
            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            .font(.custom("custom", fixedSize: 16))
            .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                    
                )
            .background(Color(uiColor: .systemGray6))
            .bold()
        
    }
}

struct FieldForm_Preview: PreviewProvider {
    static var previews: some View {
        FieldForm(placeHolder: "Ville de départ", value: "")
            .previewLayout(.sizeThatFits)
    }
}

//----------------------------

//-----------------------------

struct SwitchFormView: View {
    
    var title : String
    @State var active : Bool
    
    var body: some View {
        
        VStack(){
            
            Toggle(title, isOn: $active)
                .font(.custom("custom", size: 18))
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .animation(.easeInOut)
            
        }
    }
    
}

struct SwitchFormView_Preview: PreviewProvider {
    static var previews: some View {
        SwitchFormView(title: "Entre particuliers", active: false)
            .previewLayout(.sizeThatFits)
    }
}

//----------------------------
