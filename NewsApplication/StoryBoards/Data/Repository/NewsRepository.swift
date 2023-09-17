//
//  Repo.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation
import RxSwift
import Alamofire


class NewsRepository {
    var newsList = BehaviorSubject<[Article]>(value: [Article]())

    func loadNews(){
        fetchNews { response in
            switch response {
            case .success(let newsResponse):
                self.newsList.onNext(newsResponse.articles)
                print(newsResponse)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // API İsteği
    func fetchNews(completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        let apiKey = "972badf428cc4fdaab768df313e0d950"
        let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
        
        AF.request(url).responseDecodable(of: NewsResponse.self) { response in
            switch response.result {
            case .success(let newsResponse):
                completion(.success(newsResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func searchNews(word:String){
    }
}
