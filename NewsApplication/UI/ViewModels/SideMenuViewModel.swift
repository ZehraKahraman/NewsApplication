//
//  SideMenuViewModel.swift
//  NewsApplication
//
//  Created by zehra on 18.09.2023.
//

import Foundation

class SideMenuViewModel {
    let newsRepository = NewsRepository()
    
    func getCategoryList(word: String) {
        newsRepository.getCategoryNews(word: word)
    }
}
