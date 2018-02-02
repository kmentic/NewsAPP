//
//  ViewController.swift
//  NewsApp
//
//  Created by RobinKment on 30.01.18.
//  Copyright © 2018 Filip Kment. All rights reserved.
//

import UIKit
import Alamofire
import CodableAlamofire

class RecentVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var articles = [Article]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupTableView()
        getData(urlStr: "https://newsapi.org/v2/top-headlines?country=cz&apiKey=5a1276cac1444e7da09bd52e1b1851b1")

    }
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RecentCell.self)
        tableView.separatorStyle = .none
    }
    
    func getData(urlStr: String) {
        articles.removeAll()
        tableView.reloadData()
        let url = URL(string: urlStr)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 // It is necessary for correct decoding. Timestamp -> Date.
        
        Alamofire.request(url).responseDecodableObject(keyPath: "articles", decoder: decoder) { (response: DataResponse<[Article]>) in

            if let articles = response.result.value {
                    self.articles = articles
                    self.tableView.reloadData()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sourceUIBar(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "SourcesVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destation = segue.destination as? ArictleVC {
            if let arictle = sender as? Article {
                destation.arictle = arictle
            }
        }
        
        if let destation = segue.destination as? SourcesVC {
            destation.delegate = self
        }
    }
    
}
extension RecentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as RecentCell
        print(indexPath.row)
        print(articles.count)
        
        cell.configureCell(article: articles[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let article = articles[indexPath.row]
        performSegue(withIdentifier: "ArictleVC", sender: article)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension RecentVC : SelectedProtocol {
    func selectedSource(source: Source) {
        if let id = source.id {
            getData(urlStr: "https://newsapi.org/v2/top-headlines?sources=\(id)&apiKey=5a1276cac1444e7da09bd52e1b1851b1")
            title = source.name
        }
    }
    
    
}

