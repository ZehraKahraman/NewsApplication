//
//  NewsDetailViewModel.swift
//  NewsApplication
//
//  Created by varol on 18.09.2023.
//

import Foundation

class NewsDetailViewModel {
    var newsRepository = NewsRepository()
    
    func saveNews(news: Article) {
        newsRepository.saveNews(news: news)
    }
}
