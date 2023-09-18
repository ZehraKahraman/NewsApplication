//
//  Repo.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation
import RxSwift
import Alamofire
import Firebase


class NewsRepository {
    var newsList = BehaviorSubject<[Article]>(value: [Article]())
    var savedNewsList = BehaviorSubject<[Article]>(value: [Article]())
    
    private var tempNewsList = [Article]()
    private var tempSavedNewsList = [Article]()
    
    let ref = Database.database().reference()

    func loadNews(){
        fetchNews { response in
            switch response {
            case .success(let newsResponse):
                self.tempNewsList = newsResponse.articles
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
        let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)&pageSize=100"
        
        AF.request(url).responseDecodable(of: NewsResponse.self) { response in
            switch response.result {
            case .success(let newsResponse):
                completion(.success(newsResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func searchNews(word: String) {
        if word.isEmpty {
            newsList.onNext(tempNewsList)
            return
        }
        
        let filteredList = tempNewsList.filter {
            if let description = $0.description {
                return description.contains(word)
            }
            return false
        }
        newsList.onNext(filteredList)
    }
}

extension NewsRepository {
    func getSavedNews() {
        ref.child("article").observeSingleEvent(of: .value) { [weak self] (snapshot) in
            var articles = [Article]()
            if let value = snapshot.value as? [String: [String: Any]] {
                articles = self?.convertJSONToArticle(jsonDictionary: value) ?? []
            }
            self?.tempSavedNewsList = articles
            self?.savedNewsList.onNext(articles)
        }
    }
    
    func saveNews(news: Article) {
        guard let dictionary = makeNewsDictionaryFormat(news: news),
              let date = news.publishedAt else { return }
        
        let articleRef = ref.child("article").child(date)
        articleRef.setValue(dictionary) { [weak self] (error, _) in
            if let error = error {
                print("Kullanıcı eklenemedi.")
            }
            self?.getSavedNews()
            self?.saveUserDefaults(date: date)
            self?.loadNews()
        }
    }
    
    func deleteSavedNews(date: String) {
        let articleRef = ref.child("article").child(date)

        articleRef.removeValue { [weak self] (error, _) in
            self?.getSavedNews()
            self?.loadNews()
            self?.deleteUserDefaults(date: date)
        }
    }
}

extension NewsRepository {
    private func saveUserDefaults(date: String) {
        var idArray = UserDefaults.standard.array(forKey: "SavedNewsIDs") as? [String] ?? []
        idArray.append(date)
        print(idArray)
        UserDefaults.standard.set(idArray, forKey: "SavedNewsIDs")
    }
    
    private func deleteUserDefaults(date: String) {
        var idArray = UserDefaults.standard.array(forKey: "SavedNewsIDs") as? [String] ?? []
        idArray = idArray.filter { $0 != date }
        print(idArray)
        UserDefaults.standard.set(idArray, forKey: "SavedNewsIDs")
    }
    
    func checkSavedUserDefaults(date: String) -> Bool {
        var idArray = UserDefaults.standard.array(forKey: "SavedNewsIDs") as? [String] ?? []
        let isSaved = idArray.contains(date)
        print(idArray)
        return isSaved
    }
}

extension NewsRepository {
    private func makeNewsDictionaryFormat(news: Article) -> [String: Any]? {
        do {
            let jsonData = try JSONEncoder().encode(news)
            if let dictionary = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                return dictionary
            }
        } catch {
            print("Hata: \(error)")
        }
        return nil
    }
    
    private func convertJSONToArticle(jsonDictionary: [String: [String: Any]]) -> [Article] {
        var articles: [Article] = []
        let decoder = JSONDecoder()

        for (_, value) in jsonDictionary {
            if let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []) {
                do {
                    let article = try decoder.decode(Article.self, from: jsonData)
                    articles.append(article)
                } catch {
                    print("JSON çözümleme hatası: \(error)")
                }
            }
        }
        tempSavedNewsList = articles
        savedNewsList.onNext(articles)
        
        return articles
    }
}
