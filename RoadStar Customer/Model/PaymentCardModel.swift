//
//  PaymentCardModel.swift
//  RoadStar Customer
//
//  Created by Usman Nisar on 29/07/2021.
//  Copyright © 2021 Faizan.Technology. All rights reserved.
//

import UIKit

struct PaymentCard: Encodable {
    
    let stripe_token: String
    let last_four: String
    let brand: String
    
}


struct PaymentCardResponse: Decodable {
   
    let expires_in: Int?
    let token_type: String?
    let access_token: String?
    let refresh_token: String?
    
    
    enum CodingKeys: String, CodingKey {
        case expires_in
        case token_type
        case access_token
        case refresh_token
    }
}

struct PaymentCardDeleteResponse: Decodable {
   
    let expires_in: Int?
    let token_type: String?
    let access_token: String?
    let refresh_token: String?
    
    
    enum CodingKeys: String, CodingKey {
        case expires_in
        case token_type
        case access_token
        case refresh_token
    }
}

// MARK: - PaymentCardModel
struct PaymentCardModel: Codable {
    let id, userID: Int
    let lastFour, cardID, brand: String
    let isDefault: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userID = "user_id"
        case lastFour = "last_four"
        case cardID = "card_id"
        case brand = "brand"
        case isDefault = "is_default"
    }
}

typealias CardList = [PaymentCardModel]

