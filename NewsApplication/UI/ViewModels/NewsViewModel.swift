//
//  NewsViewModel.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation
import RxSwift

class NewsViewModel {
    var newsRepo = NewsRepository()
    var newsList = BehaviorSubject<[Article]>(value: [Article]())
    
    init(){
        newsList = newsRepo.newsList
    }

    func loadNews(){
        newsRepo.loadNews()
    }
    
    func searchNews(word:String){
        newsRepo.searchNews(word: word)
    }
}
