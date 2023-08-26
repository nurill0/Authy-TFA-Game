//
//  ArrayExtension.swift
//
//  Created by Nurillo Domlajonov on 20/01/23.
//

import Foundation

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
    
}


func randomAlphanumericString(_ length: Int) -> String {
   let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
   let randomString = (0..<length).map{ _ in String(letters.randomElement()!) }.reduce("", +)
   return randomString
}
