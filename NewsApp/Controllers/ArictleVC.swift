//
//  ArictleVC.swift
//  NewsApp
//
//  Created by RobinKment on 30.01.18.
//  Copyright © 2018 Filip Kment. All rights reserved.
//

import UIKit

class ArictleVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    private var _arictle: Article!
    var arictle: Article {
        get {
            return _arictle
        } set {
            _arictle = newValue
        }
    }
    
    var favorites = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: arictle.url)
        let urlReq = URLRequest(url: url!)
        webView.loadRequest(urlReq)
        loadFavorites()
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func save() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(favorites), forKey:"favorites")
    }
    
    func loadFavorites() {
        if let data = UserDefaults.standard.value(forKey:"favorites") as? Data {
            do {
                let articles = try PropertyListDecoder().decode(Array<Article>.self, from: data)
                favorites = articles
            } catch {
                print("Error")
            }
        }
    }
    
    @IBAction func saveBtnPressed(_ sender: UIBarButtonItem) {
        favorites.append(arictle)
        save()
    }
    
  
}

