//
//  HeroHeaderUIView.swift
//  Netflix Clone
//
//  Created by Chetan Choudhary on 09/04/23.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let downloadButton: UIButton = {
        
        // Download Button in the header
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let playButton: UIButton = {
       
        // Play Button in the header
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()

    private let heroImageView: UIImageView = {
        
        // Set the image of the heroHeader
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    
    private func addGradient() {
        // used to fade the color of the hero as we move down in the header View
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    
    private func applyConstraints() {
        
        // Constraints to set the Play button at it's postion inside heroHeaderView
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            // To give the border a width
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        // Constraints to set the Download Button at it's position inside heroHeaderView
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        // To activate the Constraints
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    
    public func configure(with model: TitleViewModel){
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else{
            return
        }
        
        heroImageView.sd_setImage(with: url, completed: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
