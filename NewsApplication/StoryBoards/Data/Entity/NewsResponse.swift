//
//  NewsResponse.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}

