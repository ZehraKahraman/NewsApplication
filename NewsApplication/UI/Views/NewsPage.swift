//
//  NewsPage.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import UIKit
import Kingfisher

class NewsPage: UIViewController {
    @IBOutlet weak var categories: UIToolbar!
    @IBOutlet weak var newsSearchBar: UISearchBar!
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    var newsList = [Article]()
    var viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsSearchBar.delegate = self
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        
        _ = viewModel.newsList.subscribe(onNext: { list in
            self.newsList = list
            DispatchQueue.main.async {
                self.newsCollectionView.reloadData()

            }
        })
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth-30) / 2
        design.itemSize = CGSize(width: itemWidth, height: itemWidth*1.6)
        newsCollectionView.collectionViewLayout = design
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadNews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.loadNews()
    }

}

extension NewsPage : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchNews(word: searchText)
  }
}

extension NewsPage: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let news = newsList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        
        if let imageUrl = news.urlToImage,
           let image = URL(string: imageUrl) {
            cell.imageView.kf.setImage(with: image)
        }
        cell.titleLabel.text = news.title
        cell.descriptionLabel.text = news.description
        cell.authorLabel.text = news.author
        cell.cellProtocol = self
        cell.indexPath = indexPath
        cell.setButtonVisibility(isHidden: !viewModel.checkIsSaved(date: news.publishedAt))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let news = newsList[indexPath.row]
        viewModel.showNewsDetail(news: news, root: self)
    }
}

extension NewsPage: CellProtocol {
    func saveNews(indexPath: IndexPath) {
        let news = newsList[indexPath.row]
//        print("\(news.name!) named news is saved!")
    }
}
