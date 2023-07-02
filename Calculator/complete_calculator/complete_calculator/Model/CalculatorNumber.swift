//
//  CalculatorNumber.swift
//  complete_calculator
//
//  Created by 김종권 on 2023/07/02.
//

import Foundation

enum CalculatorNumber: CaseIterable {
    case number
    case oper
    case result
    
    var value: [String] {
        switch self {
        case .number:
            return (0...9).map(String.init).reversed() as [String]
        case .oper:
            return ["+", "-", "*", "/"]
        case .result:
            return ["="]
        }
    }
    
    init?(string: String) {
        if Self.number.value.contains(string) {
            self = .number
        } else if Self.oper.value.contains(string) {
            self = .oper
        } else if Self.result.value.contains(string) {
            self = .result
        } else {
            return nil
        }
    }
}
