//
//  CalculatorCollectionView.swift
//  complete_calculator
//
//  Created by 김종권 on 2023/07/02.
//

import UIKit

private enum Metric {
    static let spacing = 3.0 / 2
    static let numberCell = 3.0
}

final class CalculatorView: UIView {
    // MARK: UI
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let inputTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "1+2+3"
        field.textColor = .black
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Metric.spacing
        layout.minimumInteritemSpacing = Metric.spacing
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(CalculatorCell.self, forCellWithReuseIdentifier: "cell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dataSource = (0...9).map(String.init).reversed() as [String]
    var didTapCell: ((Int) -> ())?
    var didTapButton: (() -> ())?
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("\(#function) not supported")
    }
}

private extension CalculatorView {
    func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        confirmButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        addSubview(stackView)
        stackView.addArrangedSubview(inputTextField)
        stackView.addArrangedSubview(confirmButton)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        ])
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
    }
    
    @objc func tapButton() {
        didTapButton?()
    }
}

extension CalculatorView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CalculatorCell else { return UICollectionViewCell() }
        cell.prepare(numberText: dataSource[indexPath.item])
        return cell
    }
}

extension CalculatorView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didTapCell?(Int(dataSource[indexPath.item])!)
    }
}

extension CalculatorView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let fullWidth = bounds.size.width / Metric.numberCell
        let inset = (Metric.spacing) * (Metric.numberCell - 1)
        let widthPerOneItem = fullWidth - inset
        return .init(width: widthPerOneItem, height: widthPerOneItem)
    }
}
