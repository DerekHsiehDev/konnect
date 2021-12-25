//
//  StringExtension.swift
//  sc-ios
//
//  Created by Derek Hsieh on 12/24/21.
//

import Foundation

extension String {
    func sanitizeClassName() -> String {
        
        let newStr = self.dropFirst(7).lowercased()


        let characters = Array(newStr)


        var counter = 0
        for character in characters {
            if character == "(" {
                break
            }
            counter += 1
        }

        return String(newStr.prefix(counter))
    }
}
