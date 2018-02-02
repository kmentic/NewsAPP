//
//  File.swift
//  NewsApp
//
//  Created by RobinKment on 30.01.18.
//  Copyright © 2018 Filip Kment. All rights reserved.
//

import Foundation

struct Article: Codable {

    var description: String? = ""
    var title: String = "" 
    var author: String? = ""
    var publishedAt: Date = Date()
    var url: String = ""
    var urlToImage: String? = ""
    var source : SourceArticle = SourceArticle(id: "", name: "")
}

struct SourceArticle: Codable {
    
    var id: String? = ""
    var name: String = ""

    init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
}

