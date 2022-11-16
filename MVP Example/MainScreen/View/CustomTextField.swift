//
//  TextFieldDecorator.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

protocol CustomTextFieldProtocol {
    init(field: String, width: CGFloat)
}

class CustomTextField: UIView, CustomTextFieldProtocol {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionTf: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 2
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        return view
    }()
    
    required init(field: String = "", width: CGFloat) {
        super.init(frame: .zero)
        titleLabel.text = field
        layout(width: width)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(width: CGFloat) {
        addSubview(backgroundView)
        backgroundView.addSubviews(titleLabel, descriptionTf)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 60),
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            descriptionTf.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionTf.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            descriptionTf.heightAnchor.constraint(equalToConstant: 25),
            descriptionTf.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
