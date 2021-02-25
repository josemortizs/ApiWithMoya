//
//  Utils.swift
//  ApiMarvelMoya
//
//  Created by Jose Manuel Ortiz Sanchez on 22/2/21.
//  MD5: https://stackoverflow.com/questions/32163848/how-can-i-convert-a-string-to-an-md5-hash-in-ios-using-swift
//  stringValue: https://stackoverflow.com/questions/58097625/marvel-api-returns-that-hash-timestamp-and-key-combination-is-invalid-swift
//

import Foundation
import CryptoKit
import SwiftUI

func MD5(string: String) -> String {
    let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())

    return digest.map {
        String(format: "%02hhx", $0)
    }.joined()
}

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

extension Date {
    func stringValue() -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
         dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSSSS'Z'"
         return dateFormatter.string(from: self)
     }
}

func showDataInJSONFormat(data: Data) -> String {
    if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
       let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
        return String(decoding: jsonData, as: UTF8.self)
    } else {
        return "json data malformed"
    }
}

func generateHash(timestamp: String, apikey: String, privatekey: String) -> String {
    let hash = MD5(string: "\(timestamp)\(privatekey)\(apikey)")
    return hash
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

extension Color {
    public static var marvelRed: Color {
        return Color(red: 237/256, green: 29/256, blue: 36/256)
    }
}
