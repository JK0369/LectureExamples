//
//  CalculatorCell.swift
//  complete_calculator
//
//  Created by 김종권 on 2023/07/02.
//

import UIKit

private enum Metric {
    static let padding = 3.0
}

final class CalculatorCell: UICollectionViewCell {
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        label.backgroundColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("\(#function) not supported")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        prepare(numberText: nil, color: .gray)
    }
    
    func prepare(numberText: String?, color: UIColor) {
        numberLabel.text = numberText
        numberLabel.backgroundColor = color
    }
}

private extension CalculatorCell {
    func setup() {
        contentView.addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.padding),
            numberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.padding),
            numberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metric.padding),
            numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metric.padding),
        ])
    }
}
