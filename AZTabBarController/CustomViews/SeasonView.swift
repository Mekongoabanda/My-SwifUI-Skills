//
//  SeasonView.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 06/02/2023.
//

import SwiftUI

struct SeasonView: View {
    
    var index: Int
    
    var body: some View {
        
        VStack {
            Text("Saison \(index)")
                .font(.largeTitle)
            .bold()
        
        Image("\(index)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
        }
        
    }
}

struct SeasonView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonView(index: 2)
            .previewLayout(.sizeThatFits)
    }
}
