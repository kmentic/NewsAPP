//
//  SourcesCell.swift
//  NewsApp
//
//  Created by RobinKment on 30.01.18.
//  Copyright © 2018 Filip Kment. All rights reserved.
//

import UIKit

class SourcesCell: UITableViewCell {
    @IBOutlet weak var categoryLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var urlLbl: UILabel!
    
    @IBOutlet weak var countryLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func configureCell(source: Source) {
    
        categoryLbl.text = source.category
        nameLbl.text = source.name
        descriptionLbl.text = source.description
        urlLbl.text = source.url
        countryLbl.text = source.country
        
        
      
        
    }
    
}
