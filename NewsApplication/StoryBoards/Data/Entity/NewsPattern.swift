//
//  NewsPattern.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation


class NewsPattern : Codable {
    var id:String?
    var name:String?
    var description:String?
    var url:String?
    var category:String?
    
    init(){
        
    }
    
    init(id:String, name:String, description:String, url:String, category:String){
        self.id = id
        self.name = name
        self.description = description
        self.url = url
        self.category = category
    }
}
