//
//  OrderItem.swift
//  CupcakeCorner
//
//  Created by Beto Toro on 26/07/22.
//

import Foundation

struct OrderItem: Codable {
  
  enum CodingKeys: CodingKey {
    case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
  }

  var type = 0
  var quantity = 3
  
  var extraFrosting = false
  var addSprinkles = false
  
  var name = ""
  var streetAddress = ""
  var city = ""
  var zip = ""
  
  var specialRequestEnabled = false {
    didSet {
      if specialRequestEnabled == false {
        extraFrosting = false
        addSprinkles = false
      }
    }
  }
  var hasValidAddress: Bool {
    if name.isReallyEmpty || streetAddress.isReallyEmpty || city.isReallyEmpty || zip.isReallyEmpty {
      return false
    }
    
    return true
  }
  
  var cost: Double {
    // $2 per cake
    var cost = Double(quantity) * 2
    
    // complicated cakes cost more
    cost += (Double(type) / 2)
    
    // $1/cake for extra frosting
    if extraFrosting {
      cost += Double(quantity)
    }
    
    // $0.50/cake for sprinkles
    if addSprinkles {
      cost += Double(quantity) / 2
    }
    
    return cost
  }
}
