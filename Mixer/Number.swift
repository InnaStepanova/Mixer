//
//  Number.swift
//  Mixer
//
//  Created by Лаванда on 12.05.2023.
//

import UIKit

struct Number {
    let number: Int
    var isCheck = false
}

extension Number {
    static func getNumbers() -> [Number] {
        var numbers: [Number] = []
        for i in 1...30 {
            let number = Number(number: i)
            numbers.append(number)
        }
        return numbers
    }
}
