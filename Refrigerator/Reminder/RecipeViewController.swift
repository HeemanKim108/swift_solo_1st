//
//  RecipeViewController.swift
//  FRIDGE
//
//  Created by HeemanKim on 2021/11/30.
//

import UIKit

final class RecipeViewController: UIViewController {
    
    @IBOutlet weak var Japanese: UIImageView!
    @IBOutlet weak var Korean: UIImageView!
    @IBOutlet weak var English: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    Japanese.image = UIImage(named: "Japanese")
    Korean.image = UIImage(named: "Korean")
    English.image = UIImage(named: "English")
    }
 
//    let imageShadowView: UIView = {
//        let aView = UIView()
//        //shadow
//        aView.layer.shadowOffset = CGSize(width: 5, height: 5)
//        aView.layer.shadowOpacity = 0.7
//        aView.layer.shadowRadius = 5
//        aView.layer.shadowColor = UIColor.gray.cgColor
//        return aView
//    }()
    
//    let imageView: UIImageView = {
//        let aImageView = UIImageView()
//        aImageView.backgroundColor = .red
//        aImageView.image = UIImage(named: "Japanese")
//        aImageView.contentMode = .scaleAspectFit
//        //round
//        aImageView.layer.cornerRadius = 150
//        //cut over
//        aImageView.clipsToBounds = true
//
//        aImageView.translatesAutoresizingMaskIntoConstraints = false
//        return aImageView
//    }()
//
    
    
    @IBAction func UrlAction(_ sender: UIButton) {
        if let url = URL(string: "https://www.allrecipes.com/recipes/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func UrlAction2(_ sender: UIButton) {
        if let url2 = URL(string: "https://www.kikkoman.co.jp/homecook/index.html") {
            UIApplication.shared.open(url2, options: [:])
        }
    }
    
    
    @IBAction func UrlAction3(_ sender: UIButton) {
        if let url3 = URL(string: "https://www.10000recipe.com/") {
            UIApplication.shared.open(url3, options: [:])
        }
    }
    
}
