// Created by Gayan Dias on 11/09/2022.

import SwiftUI

struct RecipeStepsCard: View {
    let recipe: RecipeDetail?
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(String(format: "%@%@%d%@", L10n.Label.steps,"(",
                        recipe?.analyzedInstructions?.first?.steps?.count ?? 0,")"))
               .foregroundColor(.neutral40)
               .font(.sourceSansPro(.bold, size: 20))
            
            ScrollView (.vertical, showsIndicators: false) {
                VStack (alignment: .leading) {
                    ForEach(recipe?.analyzedInstructions ?? [], id: \.name) { instruction in
                        ForEach(instruction.steps ?? [], id: \.number) { ingredient in
                            RecipeSteps(step: ingredient)
                        }
                    }
                }
            }
        }
    }
}

struct RecipeSteps: View {
    let step : ProducingSteps?
    
    var body: some View {
        ZStack {
            HStack() {
                Image.Images.bulletCheckmark
                Text(step?.step ?? L10n.Label.notAvailable)
                    .font(.sourceSansPro(.regular, size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.neutral40)
                    .lineLimit(20)
            }
            .padding(.leading, 2)
            .background(Color.neutral10.edgesIgnoringSafeArea(.all))
            .foregroundColor(.neutral40)
            .cornerRadius(8.0)
        }
    }
}


