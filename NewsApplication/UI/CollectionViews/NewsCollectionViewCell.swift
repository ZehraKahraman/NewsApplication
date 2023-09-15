//
//  NewsCollectionViewCell.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import UIKit

protocol CellProtocol{
    func saveNews(indexPath:IndexPath)
}

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsTextField: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    var cellProtocol:CellProtocol?
    var indexPath:IndexPath?
    
    @IBAction func saveButton(_ sender: Any) {
        cellProtocol?.saveNews(indexPath: indexPath!)
    }
    
}
