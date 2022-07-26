//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Beto Toro on 26/07/22.
//

import Foundation

extension String {
  var isReallyEmpty: Bool {
      self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }
}
