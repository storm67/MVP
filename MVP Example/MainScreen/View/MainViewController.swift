//
//  ViewController.swift
//  MVP Example
//
//  Created by Andrey Gubin on 24.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    fileprivate let presenter: MainPresenterProtocol
    fileprivate let mainView: MainScreenView
        
    init(presenter: MainPresenterProtocol, mainView: MainScreenView) {
        self.presenter = presenter
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = mainView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        endEditingCatch()
        view.backgroundColor = .white
    }
    
    fileprivate func setUpTableView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    fileprivate func endEditingCatch() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.tableView.addGestureRecognizer(gesture)
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.countOfRows(section: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.sectionCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let child = presenter.element(index: indexPath.row)
        let type = presenter.getSectionType(index: indexPath.section)
        let count = presenter.countOfRows(section: indexPath.section)
            switch type {
            case .personality, .adder:
                return CellFactory.dequeueMainCell(tableView: tableView,
                                                              child: child,
                                                              sectionType: type,
                                                              delegate: self,
                                                              indexPath: indexPath,
                                                              count: count)
            case .remove:
                return CellFactory.dequeueFooterView(delegate: self)
            }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let type = presenter.getSectionType(index: section)
        let max = presenter.max()
        switch section {
        case .zero:
            return HeaderView(title: "Персональные данные", sectionType: type, max: max)
        case 1:
            return HeaderView(title: "Дети(макс. 5)", sectionType: type, delegate: self, max: max)
        default:
            return .init()
        }
    }
    
    
}

extension MainViewController: HeaderViewDelegate {
    
    func add() {
        presenter.add { [weak self] in
            self?.mainView.tableView.reloadData()
            if let hideProtocol = mainView.tableView.headerView(forSection: 1) as? BackgroundViewHiding,
               presenter.max() {
                hideProtocol.remove()
            }
        }
    }
    
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let hideProtocol = mainView.tableView.headerView(forSection: 1) as? BackgroundViewHiding {
            hideProtocol.hide(scrollView.contentOffset.y > 221)
        }
    }
}

extension MainViewController: MainInfoRedactorProtocol {
    
    func tfTextWasChanged(position: Position, indexPath: IndexPath, text: String?) {
        presenter.change(indexPath: indexPath, position: position, text: text)
    }
    
    func delete(indexPath: IndexPath) {
        presenter.deleteUser(withIndex: indexPath.row, { [weak self] in
            self?.mainView.tableView.reloadData()
        })
    }
    
}

extension MainViewController: FooterViewDelegate {

    func remove() {
        let alertController = AlertFactory.createAlertController { [weak self] in
            self?.presenter.removeAll {
                self?.mainView.tableView.reloadData()
            }
        }
        navigationController?.present(alertController, animated: true)
    }
    
}
