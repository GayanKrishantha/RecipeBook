// Created by Gayan Dias on 11/09/2022.

import SwiftUI

struct FavouriteStatus: View {
    let isFavourite: Bool

    var body: some View {
        ZStack {
            isFavourite ?
            Image.Icons.Arrow.right
                .resizable()
                .foregroundColor(.neutral00)
                .frame(width: 20, height: 20) :
            Image.Icons.Arrow.right
                    .resizable()
                    .foregroundColor(.neutral00)
                    .frame(width: 20, height: 20)
        }
    }
}

struct FavouriteStatus_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FavouriteStatus(isFavourite: true)
            FavouriteStatus(isFavourite: false)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
