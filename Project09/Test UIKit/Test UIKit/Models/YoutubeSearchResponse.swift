//
//  YoutubeSearchResponce.swift
//  Test UIKit
//
//  Created by Sarfaroz on 7/11/22.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}


//
//items =     (
//            {
//        etag = 0sGg5g5KQTO7gjdI9rsy6eK2FNI;
//        id =             {
//            kind = "youtube#video";
//            videoId = uq2OGLUel0M;
//        };
//        kind = "youtube#searchResult";
//    },
