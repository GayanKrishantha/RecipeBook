// Created by Gayan Dias on 13/08/2022.

import SwiftUI

struct RecipeBookDetailView: View {
    @ObservedObject private(set) var viewModel: RecipeBookDetailViewModel

    init(viewModel: RecipeBookDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                AsyncImageCash(url: (viewModel.recipe?.image
                                     ?? URL(string: L10n.Label.notAvailable))!,
                               placeholder: { Text(L10n.Label.loading) },
                   image: { Image(uiImage: $0).resizable() }
                )
                .frame(maxWidth: .infinity, maxHeight: 250)
                .padding(.bottom, 5)
                
                IngredientsCard(recipe: viewModel.recipe)
                    .padding(.all, 16)
                
                RecipeStepsCard(recipe: viewModel.recipe)
                    .padding(.all, 16)
                
                RecipeSummaryCard(recipe: viewModel.recipe)
                    .padding(.all, 16)
            }
        }.background(.white)
        .introspectScrollView { scrollView in
            scrollView.alwaysBounceVertical = false
        }
    }
}

struct RecipeBookDetailView_Previews: PreviewProvider {
    private static var viewModel: RecipeBookDetailViewModel {
        let recipe = RecipeDetail(id: 23456,
                                  title: "Japalac Cocktail",
                                  readyInMinutes: 45,
                                  servings: 1,
                                  image: URL(string: "https://spoonacular.com//648452-556x370.jpg"),
                                  imageType: "jpg",
                                  summary: "The recipe Japalac Cocktail can be made <b>in about about 45 minutes</b>.",
                                  dishTypes: ["beverage",
                                              "drink"],
                                  instructions: "Add all ingredients to a mixing glass.",
                                  analyzedInstructions: [AnalyzedInstructions(name: "jh", steps: [ProducingSteps(number: 56765, step: "Tesyuyh")])],
                                  sourceName: "Foodista",
                                  vegetarian: true,
                                  vegan: true,
                                  glutenFree: true,
                                  veryHealthy: true,
                                  dairyFree: true,
                                  cheap: true,
                                  veryPopular: true,
                                  sustainable: true,
                                  lowFodmap: true,
                                  license: "CC BY 3.0",
                                  pricePerServing: 44.46,
                                  aggregateLikes: 5,
                                  extendedIngredients: [Ingredients(id: 45654, aisle: "Alcoholic Beverages", image: "beer.jpg", consistency: "LIQUID", nameClean: "rye beer", originalName: "3/4 ounce Rittenhouse Rye", amount: 0.75)])
        return RecipeBookDetailViewModel(recipe: recipe)
    }

    static var previews: some View {
        Group {
            RecipeBookDetailView(viewModel: viewModel)
                .previewDevice("iPhone 12")

            RecipeBookDetailView(viewModel: viewModel)
                .previewDevice("iPhone 12 Pro Max")

            RecipeBookDetailView(viewModel: viewModel)
                .previewDevice("iPhone SE (2nd generation)")

            RecipeBookDetailView(viewModel: viewModel)
                .previewDevice("iPhone SE (1st generation)")
        }.previewLayout(.sizeThatFits)
            .padding()
    }
}
