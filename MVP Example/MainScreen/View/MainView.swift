//
//  MainView.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

final class MainScreenView: UIView {
    
    weak var delegate: FooterViewDelegate?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 150
        tableView.register(MainViewCell.self, forCellReuseIdentifier: MainViewCell.identifier)
        tableView.tableFooterView?.frame.size = .init(width: 100, height: 100)
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    var removeButton: UIButton = {
        let removeButton = UIButton()
        removeButton.setTitleColor(.red, for: .normal)
        removeButton.setTitle("Очистить", for: .normal)
        removeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.addTarget(self, action: #selector(remove), for: .touchUpInside)
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func remove() {
        delegate?.remove()
    }
    
}
