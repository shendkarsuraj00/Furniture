//
//  Product.swift
//  Furniture
//
//  Created by Macbook on 25/02/25.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var supplier: String
    var price: Int
    
}


struct MockData {
    static let products = [
        Product(name: "Leather couch", image: "SofaSet", description: "", supplier: "IEKA", price: 12000),
        Product(name: "Coup board", image: "Cupboard", description: "", supplier: "Walmart", price: 18000),
        Product(name: "Dinner Table", image: "DinnerTable", description: "", supplier: "IEKA", price: 9000),
        Product(name: "Office Table", image: "OfficeTable", description: "", supplier: "Home Depo", price: 15000),
        Product(name: "Leaving couch", image: "SofaSet", description: "", supplier: "Walmart", price: 12000),
        Product(name: "Office Table", image: "OfficeTable", description: "", supplier: "IEKA", price: 19000)
    ]
}
