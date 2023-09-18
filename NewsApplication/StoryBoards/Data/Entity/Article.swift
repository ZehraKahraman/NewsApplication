//
//  NewsPattern.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation


// MARK: - Article
struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
