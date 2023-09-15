//
//  NewsResponse.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation

class NewsResponse : Codable {
    var news:[NewsPattern]?
    var status:String?
}
