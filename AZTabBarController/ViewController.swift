//
//  ViewController.swift
//  AZTabBarController
//
//  Created by Yannick Edouard MEKONGO ABANDA on 25/01/2023.
//

import Foundation
import AVFoundation
import UIKit
import SnapKit
import SwiftUI

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    let profileImage = UIImage(named: "picarb")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let imageSize = CGSize(width: 22, height: 22)
        
        // Create Tab one
        let tabOne = SearchViewController()
        let tabOneBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search_gray")?.resizeImageTo(size: imageSize), selectedImage: UIImage(named: "search_green")?.resizeImageTo(size: imageSize))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = UIHostingController(rootView: DirectUIView())
        let tabTwoBarItem2 = UITabBarItem(title: "Add", image: UIImage(named: "direct_gray")?.resizeImageTo(size: imageSize), selectedImage: UIImage(named: "direct")?.resizeImageTo(size: imageSize))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab two
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabThree = storyboard.instantiateViewController(withIdentifier: "destination")
        let tabThreeBarItem3 = UITabBarItem(title: "Trajets", image: UIImage(named: "destination_gray")?.resizeImageTo(size: imageSize), selectedImage: UIImage(named: "destination")?.resizeImageTo(size: imageSize))
        
        
        tabThree.tabBarItem = tabThreeBarItem3
        
        // Create Tab two
        let tabFour = UIHostingController(rootView: ChatUIView())
        let tabThreeBarItem4 = UITabBarItem(title: "Chat", image: UIImage(named: "chat_gray")?.resizeImageTo(size: imageSize), selectedImage: UIImage(named: "chat")?.resizeImageTo(size: imageSize))
        
        tabFour.tabBarItem = tabThreeBarItem4
        
        // Create Tab five
        
        let tabFive = UIHostingController(rootView : ProfileView())
        let tabFiveBarItem5 = UITabBarItem(title: "Profile", image: UIImage(named: "picarb")?.resizeImageTo(size: imageSize), selectedImage: profileImage?.resizeImageTo(size: imageSize))
        
        tabFive.tabBarItem = tabFiveBarItem5
        
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour, tabFive]
        tabBar.inputViewController?.tabBarController?.addSubviewToLastTabItem(profileImage ?? UIImage())
        tabBar.tintColor = UIColor(hexString: "#19AE5F", alpha: 1)
        tabBar.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        tabBar.layer.borderWidth = 1
        tabBar.backgroundColor = .white
        

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.tabBarController?.addSubviewToLastTabItem(profileImage ?? UIImage())
    }
   
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        print("Selected \(viewController.title ?? "")")
    }
    
    
}

extension UIImage {
    
    func resizeImageTo(size: CGSize) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
    func circularImage(_ radius: CGFloat) -> UIImage? {
        var imageView = UIImageView()
        if self.size.width > self.size.height {
            imageView.frame =  CGRect(x: 0, y: 0, width: self.size.width, height: self.size.width)
            imageView.image = UIImage(named: "picarb")
            imageView.contentMode = .scaleAspectFit
        } else { imageView = UIImageView(image: self) }
        var layer: CALayer = CALayer()
    
        layer = imageView.layer
        layer.masksToBounds = true
        layer.cornerRadius = radius
        UIGraphicsBeginImageContext(imageView.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        return roundedImage
    }
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

extension UITabBarController {
    
    func addSubviewToLastTabItem(_ image: UIImage) {
        
        if let lastTabBarButton = self.tabBar.subviews.last, let tabItemImageView = lastTabBarButton.subviews.first {
            if let accountTabBarItem = self.tabBar.items?.last {
                accountTabBarItem.selectedImage = nil
                accountTabBarItem.image = nil
            }
            let imgView = UIImageView()
            imgView.frame = tabItemImageView.frame
            imgView.layer.cornerRadius = tabItemImageView.frame.height/2
            imgView.layer.masksToBounds = true
            imgView.contentMode = .scaleAspectFill
            imgView.clipsToBounds = true
            imgView.image = image
            self.tabBar.subviews.last?.addSubview(imgView)
        }
    }
}

