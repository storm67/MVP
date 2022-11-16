//
//  MainViewCell.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

final class MainViewCell: UITableViewCell {
    
    weak var delegate: MainInfoRedactorProtocol?
    let indexPath: IndexPath
    lazy var width = UIScreen.main.bounds.width
    
    lazy var textFieldFirst: CustomTextField = {
        let tf = CustomTextField(field: "Имя", width: width / 2)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.descriptionTf.addTarget(self, action: #selector(textWasChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    lazy var textFieldSecond: CustomTextField = {
        let tf = CustomTextField(field: "Возраст", width: width / 2)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.descriptionTf.addTarget(self, action: #selector(textWasChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    let deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.setTitleColor(.systemBlue, for: .normal)
        deleteButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.addTarget(self, action: #selector(remove), for: .touchUpInside)
        return deleteButton
    }()
    
    init(sectionType: SectionType, delegate: MainInfoRedactorProtocol?, child: Child, indexPath: IndexPath, count: Int) {
        self.delegate = delegate
        self.indexPath = indexPath
        super.init(style: .default, reuseIdentifier: nil)
        contentView.backgroundColor = .white
        layout(sectionType: sectionType, child: child, count: count)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func layout(sectionType: SectionType, child: Child, count: Int) {
        switch sectionType {
        case .adder:
            contentView.addSubviews(textFieldFirst, deleteButton, textFieldSecond)
            NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            deleteButton.leadingAnchor.constraint(equalTo: textFieldFirst.trailingAnchor, constant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 75),
            textFieldSecond.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            ])
        case .personality:
            contentView.addSubviews(textFieldFirst, textFieldSecond)
            NSLayoutConstraint.activate([
                textFieldSecond.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            ])
        case .remove:
            break
        }
        
        NSLayoutConstraint.activate([
            textFieldFirst.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7.5),
            textFieldFirst.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textFieldFirst.trailingAnchor.constraint(equalTo: trailingAnchor, constant: sectionType == .adder ? -200 : -35),
            textFieldFirst.heightAnchor.constraint(equalToConstant: 65),
            textFieldSecond.topAnchor.constraint(equalTo: textFieldFirst.bottomAnchor, constant: 5),
            textFieldSecond.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textFieldSecond.trailingAnchor.constraint(equalTo: trailingAnchor, constant: sectionType == .adder ? -200 : -35),
        ])
        
        setText(child: child)
    }
    
    func setText(child: Child) {
        textFieldFirst.descriptionTf.text = child.firstName
        textFieldSecond.descriptionTf.text = child.lastName
    }
    
    @objc func remove() {
        delegate?.delete(indexPath: indexPath)
    }
    
    @objc func textWasChanged(_ uiTF: UITextField) {
        switch uiTF {
        case _ where uiTF == textFieldFirst.descriptionTf:
            delegate?.tfTextWasChanged(position: .first, indexPath: indexPath, text: textFieldFirst.descriptionTf.text)
        case _ where uiTF == textFieldSecond.descriptionTf:
            delegate?.tfTextWasChanged(position: .first, indexPath: indexPath, text: textFieldSecond.descriptionTf.text)
        default:
            break
        }
    }
    
}
