// Created by Gayan Dias on 10/09/2022.

import Foundation

struct Recipe: Decodable {
    let id: Int?
    let title: String?
    let imageUrl: String?
    let usedIngredientCount: Int?
    let missedIngredientCount: Int?
    let favouriteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, title, usedIngredientCount, missedIngredientCount
        case imageUrl = "image"
        case favouriteCount = "likes"
    }
}
