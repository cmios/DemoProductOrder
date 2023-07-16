//
//  ProductModel.swift
//  ProductDemoTask
//
//  Created by CM on 15/07/23.
//

import Foundation

struct ProductDetail: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let images:String
    var isadd:Bool?
}
struct Product: Codable {
    var products: [ProductDetail]
}
