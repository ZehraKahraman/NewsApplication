//
//  NewsDetailPage.swift
//  NewsApplication
//
//  Created by zehra on 17.09.2023.
//

import UIKit
import Kingfisher

class NewsDetailPage: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    private var news: Article?
    private var viewModel = NewsDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setContent(news: Article) {
        self.news = news
        if let image = news.urlToImage,
           let imageUrl = URL(string: image) {
            imageView.kf.setImage(with: imageUrl)
        }
        titleLabel.text = news.title
        descriptionLabel.text = news.description
        authorLabel.text = news.author
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let news else { return }
        viewModel.saveNews(news: news)
    }
}
