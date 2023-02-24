//
//  RoundedImage.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 06/02/2023.
//

import SwiftUI

struct RoundedImage: View {
    var imageUrl :String
    var size: CGFloat
    var body: some View {
        
        Image(imageUrl)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size, alignment: .center)
            .clipShape(Circle())
        
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(imageUrl: "ragnar", size : 80)
            .previewLayout(.sizeThatFits)
    }
}
