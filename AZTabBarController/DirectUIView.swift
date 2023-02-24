//
//  DirectUIView.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 21/02/2023.
//

import SwiftUI


struct DirectUIView: View {
    
    var stepsCircleViews : [StepCircleButton] = [
        StepCircleButton(buttonColor: .systemGreen, number: 1),
        StepCircleButton(buttonColor: .systemGray2, number: 2),
        StepCircleButton(buttonColor: .systemGray2, number: 3),
        StepCircleButton(buttonColor: .systemGray2, number: 4)]
    
    var travelInfoForm = TraveInfosForm(fieldsForm: [FieldForm(placeHolder: "Ville de départ", value: ""),
                                                     FieldForm(placeHolder: "Ville d'arrivée", value: ""),
                                                     FieldForm(placeHolder: "Date de départ", value: ""),
                                                     FieldForm(placeHolder: "Date d'arrivée", value: ""),
                                                     FieldForm(placeHolder: "Heure de départ", value: ""),
                                                     FieldForm(placeHolder: "Heure d'arrivée", value: ""),
                                                     FieldForm(placeHolder: "Compagnie de transport", value: "")])
    
    @State var currentStep = 1
    
    @ViewBuilder
    var body: some View {
        
        VStack(alignment: .center, spacing: 30){
            
            Text("Informations du voyage")
                .textCase(.uppercase)
                .bold()
            
            HStack(alignment: .center, spacing: 10) {
                
                stepsCircleViews[0]
                stepsCircleViews[1]
                stepsCircleViews[2]
                stepsCircleViews[3]
                
            }
            
            self.travelInfoForm
            
            Spacer()
            
            HStack(spacing : 30) {
                
                Button("Précedent") {
                    
                }.padding(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15))
                .foregroundColor(.black)
                    .bold()
                    .font(.title3)
                    .background(Color(uiColor: .systemGray3))
                    .cornerRadius(15)
                
                Button("Suivant") {
                    
                    currentStep = currentStep + 1
                    
                }.padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                    .foregroundColor(.white)
                        .bold()
                        .font(.title3)
                        .background(Color(uiColor: .systemGreen))
                        .cornerRadius(15)
            }
            
            
        }.padding(EdgeInsets(top: 15, leading: 15, bottom: 20, trailing: 15))
    }
}

struct DirectUIView_Previews: PreviewProvider {
    static var previews: some View {
        DirectUIView()
    }
}

struct TraveInfosForm: View {
        
    var fieldsForm : [FieldForm]
    
    @ViewBuilder
    var body: some View {
        
        VStack(alignment: .center, spacing: 30){
            
            ScrollView(.vertical) {
                
                VStack(spacing : 15) {
                    
                    fieldsForm[0]
                    fieldsForm[1]
                    fieldsForm[2]
                    fieldsForm[3]
                    fieldsForm[4]
                    fieldsForm[5]
                    fieldsForm[6]
                    
                }
                
            }
            
            
        }
    }
}

struct TraveInfosForm_Previews: PreviewProvider {
    static var previews: some View {
        TraveInfosForm(fieldsForm:
                        [FieldForm(placeHolder: "Ville de départ", value: ""),
                       FieldForm(placeHolder: "Ville d'arrivée", value: ""),
                       FieldForm(placeHolder: "Date de départ", value: ""),
                       FieldForm(placeHolder: "Date d'arrivée", value: ""),
                       FieldForm(placeHolder: "Heure de départ", value: ""),
                       FieldForm(placeHolder: "Heure d'arrivée", value: ""),
                       FieldForm(placeHolder: "Compagnie de transport", value: "")])
    }
}

struct Step : Identifiable {
    
    var id = UUID()
    var bgColor : UIColor
    var number : Int
}

class StepsDatas {
  
}

