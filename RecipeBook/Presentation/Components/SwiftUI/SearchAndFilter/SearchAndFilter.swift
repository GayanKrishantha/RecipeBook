// Created by Gayan Dias on 11/09/2022.

import SwiftUI

struct SearchAndFilter: View {
    @Binding var search: String
    
    var body: some View {
        HStack (spacing: 16){
            HStack {
                Image.Images.search
                TextField(L10n.Field.search, text: $search)
                    .onTapGesture {
                        // TO DO
                    }
                
            }
            .padding()
            .background(Color.neutral10.edgesIgnoringSafeArea(.all))
            .cornerRadius(8)
            
            Image.Images.filter
                .padding()
                .background(Color.neutral10.edgesIgnoringSafeArea(.all))
                .cornerRadius(8.0)
                .onTapGesture {
                   // TO DO
                }
        }
    }
}
