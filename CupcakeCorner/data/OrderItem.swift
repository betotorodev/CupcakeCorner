//
//  OrderItem.swift
//  CupcakeCorner
//
//  Created by Beto Toro on 26/07/22.
//

import Foundation

struct OrderItem: Codable {
  var type = 0
  var quantity = 3
  
  var extraFrosting = false
  var addSprinkles = false
  
  var name = ""
  var streetAddress = ""
  var city = ""
  var zip = ""
}
