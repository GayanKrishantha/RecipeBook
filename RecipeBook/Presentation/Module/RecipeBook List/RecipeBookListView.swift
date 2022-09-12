// Created by Gayan Dias on 11/09/2022.

import Introspect
import SwiftUI

struct RecipeBookListView: View {
    @ObservedObject private(set) var viewModel: RecipeBookListViewModel
    @State private var searchText = ""
    @State private var showAlert = false
    @State private var confirmationShown = false

    init(viewModel: RecipeBookListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.isLoading {
                Loader(style: .dark, size: .regular)
                    .frame(maxWidth: .infinity)
                    .accessibilityIdentifier("listLoader")
            } else {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading){
                        
                        titleView
                        
                        SearchAndFilter(search: $searchText)
                        
                        ForEach(viewModel.recipeDetails, id: \.id) { recipe in
                            RecipeCard(recipe: recipe).onButtonAction(perform: {
                                self.viewModel.showDeils(recipe: recipe)
                            })
                        }
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }.accessibilityIdentifier("ScrollList")
                }
            }
        .background(.white)
        .onAppear(perform: viewModel.onAppear)
        .alert(item: $viewModel.alertMessage, content: Alert.init)
    }
    
    var titleView: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(L10n.userName)
               .foregroundColor(.neutral20)
               .font(.sourceSansPro(.regular , size: 14))
               .lineHeight(for: .labelSmall)
            
            Text(L10n.Title.mainHeader)
               .foregroundColor(.neutral40)
               .font(.sourceSansPro(.bold, size: 26))
        }
    }
}

struct RecipeBookListView_Previews: PreviewProvider {
    private static var viewModel: RecipeBookListViewModel {
        let dependencyContainer = DependencyContainer()
        let navigationController = AppNavigationController()
        let coordinator = RecipeBookCordinatorImpl(navigationController: navigationController)
        return RecipeBookListViewModel(recipeBookRepository: dependencyContainer.recipeRepository, coordinator: coordinator)
    }

    static var previews: some View {
        Group {
            RecipeBookListView(viewModel: viewModel)
                .previewDevice("iPhone 12")

            RecipeBookListView(viewModel: viewModel)
                .previewDevice("iPhone 12 Pro Max")

            RecipeBookListView(viewModel: viewModel)
                .previewDevice("iPhone SE (2nd generation)")

            RecipeBookListView(viewModel: viewModel)
                .previewDevice("iPhone SE (1st generation)")
            
            RecipeBookListView(viewModel: viewModel)
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
