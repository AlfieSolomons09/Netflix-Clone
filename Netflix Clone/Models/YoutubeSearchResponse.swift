//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Chetan Choudhary on 16/04/23.
//

import Foundation

/*
 items =     (
             {
         etag = "qxT_waLGfnXfb3Un7kiv4L8P4tc";
         id =             {
             kind = "youtube#video";
             videoId = "o07u0uKkV_g";
         };
         kind = "youtube#searchResult";
     },
 */

struct YoutubeSeachResponse: Codable{
    let items: [VideoElement]
}

struct VideoElement: Codable{
    let id: IdVideoElement
}

struct IdVideoElement: Codable{
    let kind: String
    let videoId: String
}


