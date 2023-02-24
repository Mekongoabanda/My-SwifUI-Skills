//
//  ChatUIView.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 26/01/2023.
//

import SwiftUI

struct ChatUIView: View {
    
    @State var showSeason = false
    @State var selectedSeason = 1
    
    var body: some View {
        
        NavigationView {
            
                VStack(alignment: .center, spacing: 20) {
                    
                    Image("logo")
                        .resizable()
                        .frame(height: 80)
                        .aspectRatio(contentMode: .fit)
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                        
                    Divider()
                    
                    ScrollView(.horizontal){
                        
                        HStack() {
                            ForEach(Datas().vikings()) { viking in
                                
                                NavigationLink(destination: VikingDetailView(viking: viking)) {
                                    
                                    //objet sur le lequel on clique
                                    VikingView(viking: viking)
                                }
                            }
                        }
                    }
                    
                    Divider()
                    
                    List(1..<7){ index in
                        //Au click sur le bouton on save l'id de la saison à sélectionnée et on active la l'affichage
                        Button {
                            self.selectedSeason = index
                            self.showSeason.toggle()
                        } label: {
                            SeasonView(index: index)
                        }

                        
                    }
                    .listStyle(PlainListStyle())
                    Spacer()
                    
                }
                .navigationTitle("Vikings")
                .navigationBarHidden(false)
            //On présente la saison si showSeason est à true
                .sheet(isPresented: $showSeason) {
                    SeasonView(index: selectedSeason).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                }

        }

    }
}

struct ChatUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChatUIView()
    }
}
