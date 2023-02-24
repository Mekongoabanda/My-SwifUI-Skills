//
//  VikingView.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 06/02/2023.
//

import SwiftUI

struct VikingView: View {
    
    var viking : Viking
    
    var body: some View {
        
        VStack {
            RoundedImage(imageUrl: viking.imageUrl, size: 60)
            
            Text(viking.name)
                .foregroundColor(.secondary)
                .font(.caption)
                .frame(width: 80)
                .multilineTextAlignment(.center)
        }
    }
}

struct VikingView_Previews: PreviewProvider {
    static var previews: some View {
        VikingView(viking: Datas().vikings().first!)
            .previewLayout(.sizeThatFits)
    }
}
