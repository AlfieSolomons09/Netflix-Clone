//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Chetan Choudhary on 11/04/23.
//

import Foundation

struct Constants {
    // API form TMDB website
    static let APIKey = "bf2376f84940f2c540d961029899b16b"
    // Base URL of APICaller
    static let baseURL = "https://api.themoviedb.org"
    // API of youtube to access the trailer of the movies
    static let YoutubeAPI_KEY = "AIzaSyAIZrRuSNHNxDQyVtf3GRc6KOCICu6WnGQ"
    
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error{
    case failedTogetData
}

class APICaller{
    static let shared = APICaller()
    
    // To fetch data of trending movies
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>)->Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.APIKey)") else{return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                // Results array stores the info of the movies as mentioned in API Caller
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>)->Void){
        
        // To fetch data of trending tv shows
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.APIKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
        
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>)->Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.APIKey)") else{return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping(Result<[Title],Error>)->Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.APIKey)&language=en-US&page=1") else{return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping(Result<[Title],Error>)->Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.APIKey)&language=en-US&page=1") else{return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getdiscoverMovies(completion: @escaping(Result<[Title],Error>)->Void){
        
        // https://api.themoviedb.org/3/discover/movie?api_key=<<api_key>>&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
        
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.APIKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else{return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func search(with query: String, completion: @escaping(Result<[Title],Error>)->Void){
        
        // The guard statement is often used to check the validity of optionals, and to ensure that a certain value exists and is not nil before proceeding with the execution of a block of code.
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else{
            return
        }
        
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.APIKey)&query=\(query)") else{
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getMovie(with query: String, completion: @escaping(Result<VideoElement, Error>)->Void){
        
        
        // Used to return movie poster in searchViewController
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else{return}
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else{return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(YoutubeSeachResponse.self, from: data)
                
                completion(.success(results.items[0]))
            }
            catch{
                completion(.failure(error))
                // localizedDescription is used to localize the error into different languages
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
}

// https://api.themoviedb.org/3/movie/upcoming?api_key=<<api_key>>&language=en-US&page=1


