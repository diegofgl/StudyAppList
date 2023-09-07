//
//  ViewController.swift
//  StudyAppList
//
//  Created by Diego Rodrigues on 12/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.setDelegate(delegate: self)
        configBackground()
    }
    
    func tappedButton() {
        let controller = ListViewController()
        present(controller, animated: true)
    }
    
    private func configBackground() {
        view.backgroundColor = .lightGray
    }
}

extension HomeViewController: HomeScreenProtocol {
    func tappedAddButton(text: String) {
        let controller = ListViewController()
        let model = HomeModel(name: text)
        ListViewController.list.append(model)
        navigationController?.pushViewController(controller, animated: true)
        screen?.textField.text = ""
        
    }
}
