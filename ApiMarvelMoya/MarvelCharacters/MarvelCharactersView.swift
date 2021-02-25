//
//  MarvelCharactersView.swift
//  ApiMarvelMoya
//
//  Created by Jose Manuel Ortiz Sanchez on 22/2/21.
//

import SwiftUI

struct MarvelCharactersView: View {

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewmodel = MarvelCharactersViewModel()
    @State var showInfoCharacter: Bool = false
    @State var urlCharacter: String = "https://www.google.es"
    
    private func showIsLoadingView() -> some View {
        
        ProgressView("Loading...").font(.title)
    }
    
    private func buttonLoadingMore() -> some View {
        
        Button {
            self.loadMoreCharacters()
        } label: {
            Text("Load more...")
                .fontWeight(.bold)
                .font(.subheadline)
                .padding()
                .background(Color.marvelRed)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.marvelRed, lineWidth: 5)
                )
        }.padding()

    }
    
    private func loadNavigationLink() -> some View {
        NavigationLink(destination: NavigatorWebView(request: URLRequest(url: URL(string: self.urlCharacter)!)), isActive: self.$showInfoCharacter) {
            EmptyView()
        }
    }
    
    private func loadMoreCharacters() -> Void {
        
        if (self.viewmodel.offset > self.viewmodel.totalMarvelCharacters ?? 0) {
            let characterInLocal = self.viewmodel.characters?.data?.results?.count ?? 0
            self.viewmodel.offset = self.viewmodel.totalMarvelCharacters ?? 0 - characterInLocal
        } else {
            self.viewmodel.offset += 100
        }
        
        let keys = Keys()
        self.viewmodel.getCharacters(timestamp: keys.timestamp, apikey: keys.apikey, hash: keys.hash) { (success) in
            if success != true {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    private func showListCharacters() -> some View {
        
        ScrollView {
            VStack{
                loadNavigationLink()
                if let characters = self.viewmodel.characters?.data?.results {
                    ForEach(characters.filter({
                        $0.resultDescription != nil
                        && $0.thumbnail?.path != "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available"
                        && $0.resultDescription != ""
                    })) { character in
                        MarvelCharacterItemView(character: character)
                            .onTapGesture {
                                self.urlCharacter = character.urls?[0].url ?? ""
                                self.showInfoCharacter.toggle()
                            }
                    }
                    buttonLoadingMore()
                } else {
                    EmptyView()
                }
            }.animation(.default)
            .opacity(self.viewmodel.isLoading ? 0.1 : 1)
        }
    }
    
    var body: some View {
        
        ZStack {
            if self.viewmodel.isLoading {
                showIsLoadingView()
            }
            showListCharacters()
        }.alert(isPresented: self.$viewmodel.showAlert) {
            Alert(title: Text("Error"), message: Text(self.viewmodel.alertMessage), dismissButton: .default(Text("OK")))
        }.onAppear{
            let keys = Keys()
            self.viewmodel.getCharacters(timestamp: keys.timestamp, apikey: keys.apikey, hash: keys.hash) { (success) in
                if success != true {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }.onDisappear{
            self.viewmodel.characters = nil
            self.viewmodel.offset = 0
        }
    }
}

struct MarvelCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        MarvelCharactersView()
    }
}
