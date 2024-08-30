//
//  Model.swift
//  GameStream
//
//  Created by Jackson Cuevas on 29/8/24.
//

import Foundation

// MARK: - Game
struct Game: Codable {
    let title, studio, contentRaiting, publicationYear: String
    let description: String
    let platforms, tags: [String]
    let videosUrls: VideosUrls
    let galleryImages: [String]
}

// MARK: - VideosUrls
struct VideosUrls: Codable {
    let mobile, tablet: String
}

typealias Games = [Game]
