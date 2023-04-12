//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Chetan Choudhary on 08/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // Titles of each section
    let sectionTitles: [String] = [
        "Trending Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top Rated"
    ]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
        
        // API Caller Function
        fetchData()
    }
    
    private func configureNavBar() {
        
        // If the image is not appearing on the left it might be due to the size and constraints of the image.
        var image = UIImage(named: "netflixLogo")
        // To keep the image original as it is, if not used the logo will appear in a blue color instead of red.
        image = image?.withRenderingMode(.alwaysOriginal)
        // To keep the image on the left side of navigation Bar
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        // To add other objects to the navBar including comingSoon and my profile
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        // To keep navigationItem color white instead of blue
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    private func fetchData() {
//        APICaller.shared.getTrendingMovies { results in
//            switch results{
//
//            case.success(let movies):
//                print(movies)
//            case.failure(let error):
//                print(error)
//            }
//        }
        
//        APICaller.shared.getTrendingTvs { results in
//
//        }
        
//        APICaller.shared.getUpcomingMovies { _ in
//
//        }
        
//        APICaller.shared.getPopular { _ in
//            
//        }
        
//        APICaller.shared.getTopRated { _ in
//
//        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    // All the colums of the rows that are used to add the Name of the films 
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    // Single horizontal line of each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
        
        return cell
    }
    
    // Height of the Section
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // Height of header Label
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // Setting the header of each section with their size and font
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    // To dispay header of each Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    
    // To make sure that navigationBar does not stick to the top when will scroll up in the application.
    // Also to make sure that it sticks to the top when pulled down intially.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    
}
