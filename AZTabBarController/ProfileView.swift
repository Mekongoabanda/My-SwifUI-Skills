//
//  ProfileView.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 25/01/2023.
//

import SwiftUI

struct ProfileView: View {
    
    var discussionsList = DiscussionsData().datas()
    var body: some View {
        
        NavigationView {
            
            List(discussionsList) { discussion in
                
                DiscussionUIView(imageUrl: discussion.imageUrl, size: 60, borderWith: 15, userCertified: discussion.userCertified, smallImageSize: 25, message: discussion.message, name: discussion.name, time: discussion.time)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Discussions")
            .navigationBarHidden(false)
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
