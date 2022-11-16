//
//  HeaderView.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
    weak var delegate: HeaderViewDelegate?
        
    fileprivate var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate var backView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemBlue.cgColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 17.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setImage(.init(systemName: "plus"), for: .normal)
        addButton.imageEdgeInsets = .init(top: 0, left: -10, bottom: 0, right: 0)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.setTitle("Добавить ребенка", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
        return addButton
    }()
    
    init(title: String, sectionType: SectionType, delegate: HeaderViewDelegate? = nil, max: Bool) {
        self.delegate = delegate
        super.init(reuseIdentifier: nil)
        mainTitleLabel.text = title
        layout(sectionType: sectionType, max: max)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    fileprivate func layout(sectionType: SectionType, max: Bool) {
        contentView.addSubviews(mainTitleLabel)
        if case .adder = sectionType {
            if !max {
                contentView.addSubview(backView)
                backView.addSubview(addButton)
                NSLayoutConstraint.activate([
                    backView.topAnchor.constraint(equalTo: topAnchor, constant: -2.5),
                    backView.leadingAnchor.constraint(equalTo: mainTitleLabel.trailingAnchor, constant: 25),
                    backView.heightAnchor.constraint(equalToConstant: 35),
                    backView.widthAnchor.constraint(equalToConstant: 170),
                    addButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 2.5),
                    addButton.leadingAnchor.constraint(equalTo: mainTitleLabel.trailingAnchor, constant: 40),
                    addButton.heightAnchor.constraint(equalToConstant: 30),
                ])
            }
        }
        NSLayoutConstraint.activate([
            mainTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainTitleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func add() {
        delegate?.add()
    }
    
}

extension HeaderView: BackgroundViewHiding {
    func hide(_ cond: Bool) {
        backView.isHidden = cond
        addButton.isHidden = cond
    }
    func remove() {
        backView.removeFromSuperview()
        addButton.removeFromSuperview()
    }
}
