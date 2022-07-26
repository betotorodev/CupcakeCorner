//
//  Order.swift
//  CupcakeCorner
//
//  Created by Beto Toro on 25/07/22.
//

import SwiftUI

class Order: ObservableObject {
  
//  enum CodingKeys: CodingKey {
//    case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
//  }
  
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
  
  @Published var orderItem = OrderItem()
  
//  @Published var type = 0
//  @Published var quantity = 3
  
  @Published var specialRequestEnabled = false {
    didSet {
      if specialRequestEnabled == false {
        orderItem.extraFrosting = false
        orderItem.addSprinkles = false
      }
    }
  }
  
//  @Published var extraFrosting = false
//  @Published var addSprinkles = false
//
//  @Published var name = ""
//  @Published var streetAddress = ""
//  @Published var city = ""
//  @Published var zip = ""
  
  var hasValidAddress: Bool {
    if orderItem.name.isEmpty || orderItem.streetAddress.isEmpty || orderItem.city.isEmpty || orderItem.zip.isEmpty {
      return false
    }
    
    if orderItem.name != orderItem.name.trimmingCharacters(in: .whitespacesAndNewlines) || orderItem.streetAddress != orderItem.streetAddress.trimmingCharacters(in: .whitespacesAndNewlines) || orderItem.city != orderItem.city.trimmingCharacters(in: .whitespacesAndNewlines) || orderItem.zip != orderItem.zip.trimmingCharacters(in: .whitespacesAndNewlines) {
      return false
    }
    
    return true
  }
  
  var cost: Double {
    // $2 per cake
    var cost = Double(orderItem.quantity) * 2
    
    // complicated cakes cost more
    cost += (Double(orderItem.type) / 2)
    
    // $1/cake for extra frosting
    if orderItem.extraFrosting {
      cost += Double(orderItem.quantity)
    }
    
    // $0.50/cake for sprinkles
    if orderItem.addSprinkles {
      cost += Double(orderItem.quantity) / 2
    }
    
    return cost
  }
  
  init() { }
//
//  func encode(to encoder: Encoder) throws {
//    var container = encoder.container(keyedBy: CodingKeys.self)
//
//    try container.encode(type, forKey: .type)
//    try container.encode(quantity, forKey: .quantity)
//
//    try container.encode(extraFrosting, forKey: .extraFrosting)
//    try container.encode(addSprinkles, forKey: .addSprinkles)
//
//    try container.encode(name, forKey: .name)
//    try container.encode(streetAddress, forKey: .streetAddress)
//    try container.encode(city, forKey: .city)
//    try container.encode(zip, forKey: .zip)
//  }
//
//  required init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//
//    type = try container.decode(Int.self, forKey: .type)
//    quantity = try container.decode(Int.self, forKey: .quantity)
//
//    extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//    addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//
//    name = try container.decode(String.self, forKey: .name)
//    streetAddress = try container.decode(String.self, forKey: .streetAddress)
//    city = try container.decode(String.self, forKey: .city)
//    zip = try container.decode(String.self, forKey: .zip)
//  }
}

