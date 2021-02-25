//
//  Character.swift
//  ApiMarvelMoya
//
//  Created by Jose Manuel Ortiz Sanchez on 24/2/21.
//  Herramienta utilizada para la creación del modelo de datos:
//  https://app.quicktype.io/
//

import Foundation

// MARK: - Character
struct Character: Codable {
    var status: String?
    var data: DataClassCharacter?
    var code: Int?
    var copyright, attributionText, attributionHTML, etag: String?
}

// MARK: - DataClass
struct DataClassCharacter: Codable {
    var results: [ResultCharacter]?
    var offset, count, total, limit: Int?
}

// MARK: - Result
struct ResultCharacter: Codable {
    var thumbnail: ThumbnailCharacter?
    var comics, series: ComicsCharacter?
    var id: Int?
    var stories: StoriesCharacter?
    var events: ComicsCharacter?
    var urls: [URLElementCharacter]?
    var resourceURI: String?
    var resultDescription: String?
    var modified: Date?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case thumbnail, comics, series, id, stories, events, urls, resourceURI
        case resultDescription = "description"
        case modified, name
    }
}

// MARK: - Comics
struct ComicsCharacter: Codable {
    var returned: Int?
    var collectionURI: String?
    var items: [ComicsItemCharacter]?
    var available: Int?
}

// MARK: - ComicsItem
struct ComicsItemCharacter: Codable {
    var name: String?
    var resourceURI: String?
}

// MARK: - Stories
struct StoriesCharacter: Codable {
    var returned: Int?
    var collectionURI: String?
    var items: [StoriesItemCharacter]?
    var available: Int?
}

// MARK: - StoriesItem
struct StoriesItemCharacter: Codable {
    var name: String?
    var resourceURI: String?
    var type: String?
}

// MARK: - Thumbnail
struct ThumbnailCharacter: Codable {
    var path: String?
    var thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElementCharacter: Codable {
    var type: String?
    var url: String?
}

