//
//  DiscussionsModel.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 20/02/2023.
//

import Foundation
import SwiftUI

struct DiscussionModel : Identifiable {
    
    var id = UUID()
    var name : String
    var message : String
    var imageUrl : String
    var time : String
    var userCertified : Bool
    
}

class DiscussionsData {
    
    func datas() -> [DiscussionModel] {
        
        return [DiscussionModel(name: "Bébé DJ", message: "Bonjour, je n'ai toujours pas reçu mon colis, il est où?", imageUrl: "woman1", time: "11:27", userCertified : true),
    
                DiscussionModel(name: "Marcel TATSINDA", message: "Je vous remercie pour le colis il est bien arrivé", imageUrl: "man1", time: "15:42", userCertified : false),
        
                DiscussionModel(name: "Esmeralda Lombard", message: "Vous Allez le recevoir d'ici une semaine", imageUrl: "woman2", time: "06:03", userCertified : false),
        
                DiscussionModel(name: "Ashley BELINGA", message: "Bonjour, je n'ai toujours pas reçu mon colis, il est où?", imageUrl: "woman3", time: "17:55", userCertified : true),
        
                DiscussionModel(name: "Sévérin TSAFACK", message: "Une erreur technique a eu lieu lors de la validation de mon colis", imageUrl: "man2", time: "09:27", userCertified : true),
        
                DiscussionModel(name: "Edouard ABANDA", message: "Est ce que vous pouvez me confirmer que mon colis a bien été reçu?", imageUrl: "picarb", time: "15:11", userCertified : false)]
    }
}

