//
//  Order.swift
//  CupcakeCorner
//
//  Created by Beto Toro on 25/07/22.
//

import SwiftUI

@dynamicMemberLookup
class Order: ObservableObject {
  
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
  
  @Published var data = OrderItem()
  
  subscript<T>(dynamicMember keyPath: KeyPath<OrderItem, T>) -> T {
    data[keyPath: keyPath]
  }
  
  subscript<T>(dynamicMember keyPath: WritableKeyPath<OrderItem, T>) -> T {
    get {
      data[keyPath: keyPath]
    }
    
    set {
      data[keyPath: keyPath] = newValue
    }
  }
  
}

