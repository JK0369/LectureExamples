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
            calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            calculatorView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
        var val = 0
        
        calculatorView.didTapCell = { value in
//            print(value)
            val += value
        }
        
        calculatorView.didTapButton = {
            print("tap!", val)
        }
    }
}
