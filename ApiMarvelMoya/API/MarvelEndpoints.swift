//
//  MarvelEndpoints.swift
//  ApiMarvelMoya
//
//  Created by Jose Manuel Ortiz Sanchez on 22/2/21.
//

import Foundation
import Moya

enum MarvelEndpoints {
    case getCharacters(timestamp: String, apikey: String, hash: String, limit: Int, offset: Int)
    case getInfoCharacter(characterId: Int, timestamp: String, apikey: String, hash: String)
}

extension MarvelEndpoints: TargetType {
    var baseURL: URL {
        return URL(string: "https://gateway.marvel.com:443")!
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/v1/public/characters"
        case .getInfoCharacter(let characterId, _, _, _):
            return "/v1/public/characters/\(characterId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCharacters:
            return .get
        case .getInfoCharacter:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".utf8Encoded
    }
    
    var task: Task {
        switch self {
        case .getCharacters(let timestamp, let apikey, let hash, let limit, let offset):
            return .requestParameters(parameters: ["ts": timestamp, "apikey": apikey, "hash": hash, "limit": limit, "offset": offset], encoding: URLEncoding.queryString)
        case .getInfoCharacter(_, let timestamp, let apikey, let hash):
            return .requestParameters(parameters: ["ts": timestamp, "apikey": apikey, "hash": hash], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }
}
