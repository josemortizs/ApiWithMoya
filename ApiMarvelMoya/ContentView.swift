//
//  ContentView.swift
//  ApiMarvelMoya
//
//  Created by Jose Manuel Ortiz Sanchez on 22/2/21.
//

import SwiftUI
import Moya

struct ContentView: View {
    
    @State var goToMarvelCharacterView: Bool = false
        
    var body: some View {
        NavigationView(content: {
            NavigationLink(
                destination: MarvelCharactersView(),
                isActive: self.$goToMarvelCharacterView,
                label: {
                    Text("Show Marvel Characters...")
                })
        }).onAppear{
            self.goToMarvelCharacterView = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
