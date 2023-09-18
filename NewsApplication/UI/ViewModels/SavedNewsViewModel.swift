//
//  SavedViewModel.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation
import RxSwift

class SavedNewsViewModel {
    var newsRepository = NewsRepository()
    var savedNewsList = BehaviorSubject<[Article]>(value: [Article]())
    
    init(){
        savedNewsList = newsRepository.savedNewsList
    }
    
    func loadSavedNews() {
        newsRepository.getSavedNews()
    }
    
    func deleteSavedNews(news: Article) {
        guard let date = news.publishedAt else { return }
        newsRepository.deleteSavedNews(date: date)
    }
}
