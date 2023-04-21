//
//  Movie.swift
//  Netflix Clone
//
//  Created by Chetan Choudhary on 11/04/23.
//

import Foundation

struct TrendingTitleResponse: Codable{
    let results: [Title]
}

// To store the properties of a title for the poster
struct Title: Codable{
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}




/*
 (
             {
         adult = 0;
         "backdrop_path" = "/wybmSmviUXxlBmX44gtpow5Y9TB.jpg";
         "genre_ids" =             (
             28,
             35,
             14
         );
         id = 594767;
         "media_type" = movie;
         "original_language" = en;
         "original_title" = "Shazam! Fury of the Gods";
         overview = "Billy Batson and his foster siblings, who transform into superheroes by saying \"Shazam!\", are forced to get back into action and fight the Daughters of Atlas, who they must stop from using a weapon that could destroy the world.";
         popularity = "2973.159";
         "poster_path" = "/A3ZbZsmsvNGdprRi2lKgGEeVLEH.jpg";
         "release_date" = "2023-03-15";
         title = "Shazam! Fury of the Gods";
         video = 0;
         "vote_average" = "6.966";
         "vote_count" = 648;
     },
 */
