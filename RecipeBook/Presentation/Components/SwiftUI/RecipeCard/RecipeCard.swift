// Created by Gayan Dias on 11/09/2022.

import SwiftUI

struct RecipeCard: View {
    let recipe: RecipeDetail?
    var action: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 0) {
            if let action = action {
                Button(action: action) {
                    content
                }
                .contentShape(Rectangle())
            } else {
                content
            }
        }
        .enabled(action != nil)
    }
    
    private var content: some View {
        HStack {
            AsyncImageCash(url: (recipe?.image ?? URL(string: L10n.Label.notAvailable))!,
                           placeholder: { Text(L10n.Label.loading) },
               image: { Image(uiImage: $0).resizable() }
            )
            .frame(width: 80, height: 80)
            .cornerRadius(8)
            Spacer()
            VStack (alignment: .leading, spacing: 4) {
                HStack {
                    Text(recipe?.dishTypes?.first ?? L10n.Label.notAvailable)
                        .font(.caption)
                        .foregroundColor(.brandingGreen)
                    Spacer()
                    
                    Image.Images.like
                }
                Text(recipe?.title ?? "")
                    .fontWeight(.medium)
                    .foregroundColor(.neutral40)
                
                HStack () {
                    Image.Images.star
                        .renderingMode(.template)
                        .foregroundColor(.red)
                    
                    Text(String(format: "%d %@", recipe?.aggregateLikes ?? 0,
                                L10n.Label.like))
                        .font(.caption)
                        .foregroundColor(.neutral20)
                        .padding(.leading, 2)
                }
                
                HStack {
                    Image.Images.time
                    Text(String(format: "%d %@", recipe?.readyInMinutes ?? 0,
                                L10n.Label.mins))
                        .font(.caption2)
                        .background(Color.neutral10.edgesIgnoringSafeArea(.all))
                        .foregroundColor(.neutral20)
                    
                    Image.Images.serving
                        .padding(.leading)
                    Text(String(format: "%d %@", recipe?.readyInMinutes ?? 0,
                                L10n.Label.servings))
                        .font(.caption2)
                        .background(Color.neutral10.edgesIgnoringSafeArea(.all))
                        .foregroundColor(.neutral20)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.neutral10.edgesIgnoringSafeArea(.all))
        .cornerRadius(18.0)
    }
}

extension RecipeCard {
    func onButtonAction(perform action: @escaping () -> Void ) -> Self {
         var copy = self
         copy.action = action
         return copy
     }
}
