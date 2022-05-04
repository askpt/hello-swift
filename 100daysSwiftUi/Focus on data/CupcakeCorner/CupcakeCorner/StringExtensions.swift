//
//  StringExtensions.swift
//  CupcakeCorner
//
//  Created by Andre Silva on 04/05/2022.
//

import Foundation

extension String {
  var isBlank: Bool {
    return allSatisfy({ $0.isWhitespace })
  }
}
