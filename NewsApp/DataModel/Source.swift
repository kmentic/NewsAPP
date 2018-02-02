//
//  Source.swift
//  NewsApp
//
//  Created by RobinKment on 01.02.18.
//  Copyright © 2018 Filip Kment. All rights reserved.
//

import Foundation

struct Source: Codable {
    
    var id: String? = ""
    var name: String = ""
    var language: String? = ""
    var country: String = ""
    var category: String? = ""
    var url: String = ""
    var description: String? = ""
    
    init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
}
    




