//
//  VikingDetailView.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 13/02/2023.
//

import SwiftUI

struct VikingDetailView: View {
    var viking : Viking
    @State var tap = false
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack {
                RoundedImage(imageUrl: viking.imageUrl, size: 100)
                    .onTapGesture {
                        self.tap.toggle()
                    }
                Text(viking.name)
                    .font(.title)
                    .foregroundColor(.secondary)
            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 10))
            Divider()
            
            ScrollView{
                Text(viking.desc)
                    .padding()
                
                Divider()
                
                Image(viking.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        self.tap.toggle()
                    }
            }
            Spacer()
        }
        .sheet(isPresented: $tap) {
            Image(viking.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}

struct VikingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VikingDetailView(viking: Datas().vikings()[4])
    }
}
