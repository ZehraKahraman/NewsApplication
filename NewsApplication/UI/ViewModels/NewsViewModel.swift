//
//  NewsViewModel.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation
import RxSwift
import UIKit

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
    
    func checkIsSaved(date: String?) -> Bool {
        guard let date else { return false }
        return newsRepo.checkSavedUserDefaults(date: date)
    }
    
    func showNewsDetail(news: Article, root: UIViewController) {
        let storyboard = UIStoryboard(name: "NewsDetail", bundle: nil)
        let newsDetailPage = storyboard.instantiateViewController(withIdentifier: "NewsDetailPage") as! NewsDetailPage
        root.present(newsDetailPage, animated: true) {
            newsDetailPage.setContent(news: news)
        }

    }
}
