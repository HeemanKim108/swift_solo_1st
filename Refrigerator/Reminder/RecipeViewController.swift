//
//  RecipeViewController.swift
//  FRIDGE
//
//  Created by HeemanKim on 2021/11/30.
//

import UIKit

final class RecipeViewController: UIViewController {
 
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
