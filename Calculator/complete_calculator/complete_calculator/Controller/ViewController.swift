//
//  ViewController.swift
//  complete_calculator
//
//  Created by 김종권 on 2023/06/27.
//

import UIKit

class ViewController: UIViewController {
    private let calculatorView = CalculatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

private extension ViewController {
    func setup() {
        calculatorView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(calculatorView)
        NSLayoutConstraint.activate([
            calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            calculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            calculatorView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
        var total = 0.0
        
        calculatorView.didTapCell = { value in
            print(value)
//            switch CalculatorNumber(string: value) {
//            case .number:
//
//            case .oper:
//                switch value {
//                case "+":
//
//                case "-":
//
//                case "*":
//
//                case "/":
//
//                }
//            case .result:
//
//            }
        }
        
        calculatorView.didTapBackButton = {
            print("value=", total)
        }
    }
    
    func calculate(lastTotal: Double, value: String) {
        
    }
}
