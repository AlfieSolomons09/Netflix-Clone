//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by Chetan Choudhary on 12/04/23.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {


    static let identifier = "TitleCollectionViewCell"
    
    // To give every poster image
    private let posterImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    // Use 3rd party library package SDWebImage to set UP poster images
    public func configure(with model: String){
        
        // Here the string part of url before model is the API from TMDB API where model is different for each poster 
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else{
            return
        }
        
        // to set image to the searched movie posters
        posterImageView.sd_setImage(with: url, completed: nil)
    }
    
}
