//
//  MarvelCharacterItemView.swift
//  ApiMarvelMoya
//
//  Created by Jose Manuel Ortiz Sanchez on 23/2/21.
//

import SwiftUI
import Kingfisher

struct MarvelCharacterItemView: View {
    
    @State var character: MarvelCharacter
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(character.name ?? "").font(.title)
                Text(character.resultDescription ?? "").font(.subheadline)
            }.frame(height: 100, alignment: .leading)
            Spacer()
            KFImage(URL(string: "\(character.thumbnail?.path ?? "").\(character.thumbnail?.thumbnailExtension ?? "")"))
                .resizable()
                .frame(width: 100, height: 100)
        }.padding(.leading)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
        .cornerRadius(5)
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .onAppear{
            print("\(character.thumbnail?.path ?? "").\(character.thumbnail?.thumbnailExtension ?? "")")
        }
    }
}

struct MarvelCharacterItemView_Previews: PreviewProvider {
    static var previews: some View {
        MarvelCharacterItemView(character: mockedCharacter)
    }
}
