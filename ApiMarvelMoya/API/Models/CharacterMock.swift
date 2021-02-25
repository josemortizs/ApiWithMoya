//
//  CharacterMock.swift
//  ApiMarvelMoya
//
//  Created by Jose Manuel Ortiz Sanchez on 23/2/21.
//

import Foundation

let thumbnail = Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg")
let mockedCharacter = MarvelCharacter(
    thumbnail: thumbnail,
    id: 1011334,
    resultDescription: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!",
    name: "A-Bomb (HAS)")
// used in MarvelCharacterItemView_Preview
