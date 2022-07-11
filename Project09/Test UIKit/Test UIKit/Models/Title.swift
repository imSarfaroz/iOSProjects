//
//  Movie.swift
//  Test UIKit
//
//  Created by Sarfaroz on 7/2/22.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
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
 
 {
adult = 0;
"backdrop_path" = "/56v2KjBlU4XaOv9rVYEQypROD7P.jpg";
"first_air_date" = "2016-07-15";
"genre_ids" =             (
 18,
 10765,
 9648
);
id = 66732;
"media_type" = tv;
name = "Stranger Things";
"origin_country" =             (
 US
);
"original_language" = en;
"original_name" = "Stranger Things";
overview = "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.";
popularity = "4790.722";
"poster_path" = "/49WJfeN0moxb9IPfGn8AIqMGskD.jpg";
"vote_average" = "8.617000000000001";
"vote_count" = 11474;
},
 
 */
