//
//  MarvelCharactersViewModel.swift
//  ApiMarvelMoya
//
//  Created by Jose Manuel Ortiz Sanchez on 22/2/21.
//

import Foundation
import Moya

final class MarvelCharactersViewModel: ObservableObject {
    
    let api = MoyaProvider<MarvelEndpoints>()
    
    @Published var characters: Characters?
    @Published var character: Character?
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = "Error has ocurred"
    @Published var isLoading: Bool = false
    @Published var offset: Int = 0
    @Published var limit: Int = 100
    @Published var totalMarvelCharacters: Int?
    
    func getInfoCharacter(characterID: Int, timestamp: String, apikey: String, hash: String, onSuccess: @escaping (Bool) -> Void) {
        
        self.isLoading = true
        
        api.request(.getInfoCharacter(characterId: characterID, timestamp: timestamp, apikey: apikey, hash: hash)) { response in
            switch response.publisher.result {
            case .success(let result):
                do {
                    let character = try newJSONDecoder().decode(Character.self, from: result.data)
                    self.character = character
                    self.isLoading = false
                    onSuccess(true)
                } catch (let error) {
                    self.alertMessage = error.localizedDescription
                    self.showAlert.toggle()
                    self.isLoading = false
                    onSuccess(false)
                }
            case .failure(let error):
                self.alertMessage = error.localizedDescription
                self.showAlert.toggle()
                self.isLoading = false
                onSuccess(false)
            }
        }
    }
    
    func getCharacters(timestamp: String, apikey: String, hash: String, onSuccess: @escaping (Bool) -> Void) {
        
        self.isLoading = true
                
        api.request(.getCharacters(timestamp: timestamp, apikey: apikey, hash: hash, limit: self.limit, offset: offset)) { response in
            switch response.publisher.result {
            case .success(let result):
                do {
                    let characters = try newJSONDecoder().decode(Characters.self, from: result.data)
                    if self.characters == nil {
                        self.totalMarvelCharacters = characters.data?.total ?? 0
                        self.characters = characters
                    } else {
                        self.appendNewCharacters(characters: characters.data?.results ?? [])
                    }
                    self.isLoading = false
                    onSuccess(true)
                } catch (let error) {
                    self.alertMessage = error.localizedDescription
                    self.showAlert.toggle()
                    self.isLoading = false
                    onSuccess(false)
                }
            case .failure(let error):
                self.alertMessage = error.localizedDescription
                self.showAlert.toggle()
                self.isLoading = false
                onSuccess(false)
            }
        }
    }
    
    private func appendNewCharacters(characters: [MarvelCharacter]) -> Void {
        for character in characters {
            self.characters?.data?.results?.append(character)
        }
    }
    
}
