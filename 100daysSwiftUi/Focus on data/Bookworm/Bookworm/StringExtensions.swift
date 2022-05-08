//
//  StringExtensions.swift
//  Bookworm
//
//  Created by Andre Silva on 08/05/2022.
//

import Foundation

extension String {
  var isBlank: Bool {
    return allSatisfy({ $0.isWhitespace })
  }
}
