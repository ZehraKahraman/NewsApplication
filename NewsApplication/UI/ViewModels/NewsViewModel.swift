//
//  NewsViewModel.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation
import RxSwift

class NewsViewModel {
    var newsRepo = Repo()
    var newsList = BehaviorSubject<[NewsPattern]>(value: [NewsPattern]())
    
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
