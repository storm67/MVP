//
//  FooterView.swift
//  MVP Example
//
//  Created by Andrey Gubin on 25.10.2022.
//

import UIKit

class FooterView: UITableViewCell {
    
    weak var delegate: FooterViewDelegate?
    
    var removeButton: UIButton = {
        let removeButton = UIButton()
        removeButton.setTitleColor(.red, for: .normal)
        removeButton.setTitle("Очистить", for: .normal)
        removeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.addTarget(self, action: #selector(remove), for: .allTouchEvents)
        return removeButton
    }()
    
    var backView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(delegate: FooterViewDelegate) {
        self.delegate = delegate
        super.init(style: .default, reuseIdentifier: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addSubviews(backView,removeButton)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: topAnchor, constant: -20),
            backView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backView.widthAnchor.constraint(equalToConstant: 150),
            backView.heightAnchor.constraint(equalToConstant: 40),
            removeButton.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            removeButton.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            removeButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func remove() {
        delegate?.remove()
    }
    
}
