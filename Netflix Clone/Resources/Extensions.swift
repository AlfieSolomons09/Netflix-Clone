//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Chetan Choudhary on 11/04/23.
//

import Foundation

extension String{
    
    // As every letter of each section's header is lowercased we will capitalize the first letter of each
    // Upper case first letter then drop the first lowercased letter to remove the duplicates
    func capitalizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
