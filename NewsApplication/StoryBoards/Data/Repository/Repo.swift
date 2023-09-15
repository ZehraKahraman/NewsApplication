//
//  Repo.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation
import RxSwift
import Alamofire


class Repo {
    var newsList = BehaviorSubject<[NewsPattern]>(value: [NewsPattern]())

    func loadNews(){
        let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=972badf428cc4fdaab768df313e0d950"
        
        AF.request(url,method: .get).response { response in
            if let data = response.data {
                do{
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                    if let list = newsResponse.news {
                        self.newsList.onNext(list)
                        print("Başarı : \(newsResponse.status!)")
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func searchNews(word:String){
    }
}
