//
//  DiscussionUIView.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 20/02/2023.
//

import SwiftUI

struct DiscussionUIView: View {
    
    var imageUrl :String
    var size: CGFloat
    var borderWith : CGFloat
    var userCertified: Bool
    var smallImageSize : CGFloat
    var message : String
    var name : String
    var time : String
    
    var body: some View {
        
        HStack {
            
            if userCertified {
                RoundedImageTemp(imageUrl: self.imageUrl, largeImageSize: self.size, smallImageSize: smallImageSize, borderWith: self.borderWith)
            }else {
                RoundedImageTemp(imageUrl: self.imageUrl, largeImageSize: self.size, smallImageSize: 0, borderWith: 0)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                HStack() {
                    Text(self.name)
                        .font(.title3)
                        .bold()
                    .lineLimit(1)
                    Spacer()
                    Text(self.time)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .lineLimit(1)
                }
                Text(self.message)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .lineLimit(1)
                    .frame(width: 200)
                    
            }
            
        }
    }
}

struct DiscussionUIView_Previews: PreviewProvider {
    static var previews: some View {
        DiscussionUIView(imageUrl: "woman1", size: 60, borderWith: 10, userCertified: true, smallImageSize: 25, message: "Bonjour, j'ai déja transféré votre colis, il arrivera dans 06 jours", name : "Ngouan Iton", time: "12:24" )
            .previewLayout(.sizeThatFits)
    }
}

struct RoundedImageTemp: View {
    var imageUrl :String
    var largeImageSize: CGFloat
    var smallImageSize: CGFloat
    var borderWith : CGFloat
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            
            //Border
            ZStack {
                Circle()
                    .strokeBorder(Color.green,lineWidth: self.borderWith)
                    .frame(width: largeImageSize*1.05, height: largeImageSize*1.05)
                
                RoundedImage(imageUrl: imageUrl, size: self.largeImageSize)
            }
            
            
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .frame(width: smallImageSize, height: smallImageSize)
                .foregroundColor(.green)
            
            
        }
        
    }
}

struct RoundedImageTemp_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageTemp(imageUrl: "woman1", largeImageSize: 100, smallImageSize: 35, borderWith: 1)
            .previewLayout(.sizeThatFits)
    }
}
