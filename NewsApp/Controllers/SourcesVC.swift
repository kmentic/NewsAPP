//
//  SourcesVC.swift
//  NewsApp
//
//  Created by RobinKment on 30.01.18.
//  Copyright © 2018 Filip Kment. All rights reserved.
//

import UIKit
import Alamofire
import CodableAlamofire

protocol SelectedProtocol {
    func selectedSource(source: Source)
}

class SourcesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sources = [Source]()
    
    var delegate : SelectedProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SourcesCell.self)
        tableView.separatorStyle = .none
    }
    
    func getData() {
        
        let url = URL(string: "https://newsapi.org/v2/sources?apiKey=5a1276cac1444e7da09bd52e1b1851b1")!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 // It is necessary for correct decoding. Timestamp -> Date.
        
        Alamofire.request(url).responseDecodableObject(keyPath: "sources", decoder: decoder) { (response: DataResponse<[Source]>) in
            print(response.result)
            print(response)
            
            if let sources = response.result.value {
                self.sources = sources
                print(sources)
                self.tableView.reloadData()
                print(sources[4])
                
            }
      
        }
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
extension SourcesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SourcesCell
        cell.configureCell(source: sources[indexPath.row])
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let source = sources[indexPath.row]
        delegate?.selectedSource(source: source)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}







