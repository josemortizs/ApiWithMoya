//
//  s.swift
//  ApiMarvelMoya
//
//  Created by Jose Manuel Ortiz Sanchez on 23/2/21.
//  Herramienta utilizada para la creación del modelo de datos:
//  https://app.quicktype.io/
//

import Foundation

// MARK: - Characters
struct Characters: Codable {
    var status: String?
    var data: DataClass?
    var code: Int?
    var copyright, attributionText, attributionHTML, etag: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    var results: [MarvelCharacter]?
    var offset, count, total, limit: Int?
    
    
}

// MARK: - Result
struct MarvelCharacter: Codable, Identifiable {
    var thumbnail: Thumbnail?
    var comics, series: Comics?
    var id: Int?
    var stories: Stories?
    var events: Comics?
    var urls: [URLElement]?
    var resourceURI: String?
    var resultDescription: String?
    var modified: String?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case thumbnail, comics, series, id, stories, events, urls, resourceURI
        case resultDescription = "description"
        case modified, name
    }
}

// MARK: - Comics
struct Comics: Codable {
    var returned: Int?
    var collectionURI: String?
    var items: [ComicsItem]?
    var available: Int?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    var name: String?
    var resourceURI: String?
}

// MARK: - Stories
struct Stories: Codable {
    var returned: Int?
    var collectionURI: String?
    var items: [StoriesItem]?
    var available: Int?
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    var name: String?
    var resourceURI: String?
    var type: String?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    var path: String?
    var thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    var type: String?
    var url: String?
}
