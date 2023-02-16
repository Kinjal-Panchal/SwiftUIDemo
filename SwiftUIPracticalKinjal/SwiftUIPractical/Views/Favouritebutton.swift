//
//  Favouritebutton.swift
//  SwiftUIPractical
//
//  Created by Kinjal panchal on 11/02/23.
//

import SwiftUI

struct FavoriteButton: View {
    var isFavorite: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isFavorite ? .red : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isFavorite: false) {
            print("action")
        }
    }
}
