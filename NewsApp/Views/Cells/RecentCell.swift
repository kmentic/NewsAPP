//
//  RecentCell.swift
//  NewsApp
//
//  Created by RobinKment on 30.01.18.
//  Copyright © 2018 Filip Kment. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class RecentCell: UITableViewCell {

    @IBOutlet weak var arictleImge: UIImageView!
    
    @IBOutlet weak var authorLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    let formatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
   
    func configureCell(article: Article) {
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        print(article.source.name)
        
         authorLbl.text = article.author
         titleLbl.text = article.title
         descriptionLbl.text = article.description
         dateLbl.text = formatter.string(from: article.publishedAt)
        
        
        if let image = article.urlToImage {
            getImage(url: image)
           
            
        }

        
    }
  
    func getImage(url: String) {
    
        Alamofire.request(url).responseImage { response in
            debugPrint(response)
            
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
                self.arictleImge.image = image
            }
        }
    }
    
}






