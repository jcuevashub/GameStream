//
//  Model.swift
//  GameStream
//
//  Created by Jackson Cuevas on 29/8/24.
//

import Foundation



struct Resultados: Codable {
    
    var results:[Game]
    
}

struct Games: Codable {
    var games:[Game]
}

// MARK: - Game
struct Game: Codable, Hashable {
    let title, studio, contentRaiting, publicationYear: String
    let description: String
    let platforms, tags: [String]
    let videosUrls: VideosUrls
    let galleryImages: [String]
}

// MARK: - VideosUrls
struct VideosUrls: Codable, Hashable {
    let mobile, tablet: String
}
