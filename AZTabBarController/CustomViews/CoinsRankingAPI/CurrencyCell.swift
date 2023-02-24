//
//  CurrencyCell.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 14/02/2023.
//

import UIKit
import SVGKit

class CurrencyCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var coin : Coin! {
        didSet {
            nameLabel.text = coin.name
            //On ne veut pas avoir beaucoup de chiffres après la virgule
            if let price = coin.price, let priceTemp = Float(price){
                priceLabel.text = "\(priceTemp)"
            }
            icon.layer.cornerRadius = 12
            
            if let urlString = coin.iconUrl {
                if let url = URL(string: urlString) {
                    
                    URLSession.shared.dataTask(with: url) { d, r, e  in
                        
                        if let data = d {
                            let img = UIImage(data: data)
                            DispatchQueue.main.async {
                                self.icon.image = img
                            }
                        }
                        
                    }.resume()
                    
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
