//
//  SavedNewsCollectionViewCell.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import UIKit

protocol SavedNewsCellProtocol {
    func deleteNews(indexPath: IndexPath)
}

class SavedNewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    
    var cellProtocol: SavedNewsCellProtocol?
    var indexPath: IndexPath?

    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        cellProtocol?.deleteNews(indexPath: indexPath!)
    }
}
