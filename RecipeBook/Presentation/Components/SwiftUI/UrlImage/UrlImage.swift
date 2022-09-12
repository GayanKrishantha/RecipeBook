// Created by Gayan Dias on 11/09/2022.

import SwiftUI

struct UrlImage: View {
    let url: URL?
    let width: CGFloat?
    let height: CGFloat?

    var body: some View {
        ZStack {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.neutral00)
                        .scaledToFill()
                case .failure:
                    Image.Images.defaultImage
                        .resizable()
                        .foregroundColor(.neutral00)
                        .scaledToFill()
                @unknown default:
                    EmptyView()
                }
            }.frame(width: width, height: height)
        }
    }
}

struct UrlImage_Previews: PreviewProvider {
    static var previews: some View {
        UrlImage(url: URL(string: "https://images.spoonacular.com/file/wximages/423186-90x90.png?apiKey=55ce34248be04a81982b232a8310285f")!, width: 90, height:  90)
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
