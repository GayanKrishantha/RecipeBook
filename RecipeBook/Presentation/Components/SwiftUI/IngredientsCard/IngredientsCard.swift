// Created by Gayan Dias on 11/09/2022.

import SwiftUI

struct IngredientsCard: View {
    let recipe: RecipeDetail?
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            Text(String(format: "%@%@%d%@",
                        L10n.Label.ingredients,"("
                        ,recipe?.extendedIngredients?.count ?? 0, ")"))
               .foregroundColor(.neutral40)
               .font(.sourceSansPro(.bold, size: 20))

            ScrollView (.horizontal, showsIndicators: false) {
                HStack (spacing: 16) {
                    ForEach(recipe?.extendedIngredients ?? [], id: \.id) { ingredient in
                        RecipeIngredients(ingredient: ingredient)
                    }
                }
            }
        }
    }
}

struct RecipeIngredients: View {
    let ingredient: Ingredients?
    
    var body: some View {
        ZStack {
            VStack (alignment: .center, spacing: 5) {
                AsyncImageCash(url: ((URL(string: setUrl) ?? URL(string: L10n.Label.notAvailable))!),
                               placeholder: { Text(L10n.Label.loading) },
                   image: { Image(uiImage: $0).resizable() }
                )
                .frame(width: 80, height: 80, alignment: .top )
                .padding(.bottom, 5)
                
                Text(ingredient?.consistency ?? L10n.Label.notAvailable)
                    .font(.sourceSansPro(.regular , size: 14))
                    .foregroundColor(.neutral30)
                Text(String(format: "%@%@%@", "(",ingredient?.aisle ?? L10n.Label.notAvailable,")"))
                    .font(.sourceSansPro(.italic , size: 14))
                    .foregroundColor(.neutral30)
                Text(ingredient?.originalName ?? L10n.Label.notAvailable)
                    .font(.sourceSansPro(.boldItalic , size: 14))
                    .foregroundColor(.neutral30)
                Text(String(format: "%d", ingredient?.amount ?? 0.0))
                    .font(.sourceSansPro(.bold , size: 14))
                    .foregroundColor(.neutral30)
            }
            .frame(width: 147)
            .padding()
            .background(Color.neutral10.edgesIgnoringSafeArea(.all))
            .cornerRadius(20.0)
        }
        .padding(.trailing, 25)
    }

    var setUrl: String {
        return String(format: "%@%@%@",
                      valueForAPIKey("API_BASE_URL"),
                      valueForAPIKey("INGREDIENT_EXTENSION"),
                      ingredient?.image ?? "")
    }
}


