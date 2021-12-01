//
//  RecipeViewController.swift
//  FRIDGE
//
//  Created by HeemanKim on 2021/11/30.
//

import UIKit

final class RecipeViewController: UIViewController {
    
    @IBOutlet weak var Japanese: UIImageView!
//    @IBOutlet weak var Korean: UIImageView!
//    @IBOutlet weak var English: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let customImageJ = UIImage(named: "Japanese")
//        let newWidth = 500
//        let newHeight = 400
//        let newImageRect = CGRect(x: 20, y: 118, width: newWidth, height: newHeight)
//        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
//        customImageJ?.draw(in: newImageRect)
//        let newImageJ = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
//        UIGraphicsEndImageContext()
//
//        let customImageK = UIImage(named: "Korean")
//        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
//        customImageK?.draw(in: newImageRect)
//        let newImageK = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
//        UIGraphicsEndImageContext()
//
//        let customImageE = UIImage(named: "English")
//        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
//        customImageE?.draw(in: newImageRect)
//        let newImageE = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
//        UIGraphicsEndImageContext()
//
        Japanese.image = UIImage(named: "Japanese")
//        Korean.image = UIImage(named: "Korean")
//        English.image = UIImage(named: "English")
//
    }
 
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
