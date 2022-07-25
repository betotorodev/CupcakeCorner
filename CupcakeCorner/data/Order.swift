//
//  Order.swift
//  CupcakeCorner
//
//  Created by Beto Toro on 25/07/22.
//

import SwiftUI

class Order: ObservableObject {
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
  
  @Published var type = 0
  @Published var quantity = 3
  
  @Published var specialRequestEnabled = false {
    didSet {
      if specialRequestEnabled == false {
        extraFrosting = false
        addSprinkles = false
      }
    }
  }
  
  @Published var extraFrosting = false
  @Published var addSprinkles = false
}
