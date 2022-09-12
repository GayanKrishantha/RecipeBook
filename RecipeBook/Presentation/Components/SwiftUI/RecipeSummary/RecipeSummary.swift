// Created by Gayan Dias on 11/09/2022.

import SwiftUI

struct RecipeSummaryCard: View {
    let recipe: RecipeDetail?
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(L10n.Label.summary)
               .foregroundColor(.neutral40)
               .font(.sourceSansPro(.bold, size: 20))
        
            ZStack {
                HStack () {
                    Text(recipe?.summary?.htmlToString() ?? "")
                        .font(.sourceSansPro(.regular, size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.neutral40)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.neutral10.edgesIgnoringSafeArea(.all))
                .foregroundColor(.neutral40)
                .cornerRadius(8.0)
            }
        }
    }
}
