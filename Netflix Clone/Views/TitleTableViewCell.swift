//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Chetan Choudhary on 15/04/23.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    // Used for storing data in All the controllers
    // Created to make it a resuable factor

    static let identifier = "TitleTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        // To resize label according to View
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }() 
    
    private let playTitleButton: UIButton = {
        
        let button = UIButton()
        // setting Up the image size.
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let titlePosterUIImageView: UIImageView = {
       
        let imageView = UIImageView()
        // To strech the image completely to fill the cell
        imageView.contentMode = .scaleAspectFill
        // to make the image appear inside the ViewCell
        imageView.translatesAutoresizingMaskIntoConstraints = false
        // To prevent the poster to overflowing the container
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titlePosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
        
    }
    
    private func applyConstraints() {
        
        // setting the title poster for upcoming movies
        let titlePosterUIImageViewConstraints = [
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            // Top and bottom anchor to set 10 point setup on top as well as bottom 
            titlePosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlePosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        // setting the title label text for upcoming movies
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        // Setting the play button for upcoming movies
        let playTitleButtonConstraints = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titlePosterUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playTitleButtonConstraints)
    }

    
    public func configure(with model: TitleViewModel){
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else{
            return
        }
        
        titlePosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
}
