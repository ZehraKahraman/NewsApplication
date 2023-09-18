//
//  SavedNews.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import UIKit
import RxSwift

class SavedNewsPage: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var savedNewsList = [Article]()
    var viewModel = SavedNewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self

        _ = viewModel.savedNewsList.subscribe(onNext: { list in
            self.savedNewsList = list
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth-30) / 2
        design.itemSize = CGSize(width: itemWidth, height: itemWidth*1.6)
        collectionView.collectionViewLayout = design
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadSavedNews()
    }
    
}

extension SavedNewsPage: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedNewsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let news = savedNewsList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedNewsCollectionViewCell", for: indexPath) as! SavedNewsCollectionViewCell
        
        if let imageUrl = news.urlToImage,
           let image = URL(string: imageUrl) {
            cell.imageView.kf.setImage(with: image)
        }
        cell.titleView.text = news.title
        cell.indexPath = indexPath
        cell.cellProtocol = self
        
        return cell
    }
}

extension SavedNewsPage: SavedNewsCellProtocol {
    func deleteNews(indexPath: IndexPath) {
        viewModel.deleteSavedNews(news: savedNewsList[indexPath.row])
    }
}
