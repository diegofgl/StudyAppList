//
//  ListViewController.swift
//  StudyAppList
//
//  Created by Diego Rodrigues on 12/06/23.
//

import UIKit

class ListViewController: UIViewController {
        
    var screen: ListScreen?
    static var list: [HomeModel] = []
    
    override func loadView() {
        screen = ListScreen()
        view = screen
        screen?.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackground()
        screen?.configTableView(delegate: self, dataSource: self)

    }
    
    private func configBackground() {
        view.backgroundColor = .lightGray
        
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListViewController.list.endIndex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = screen?.tableView.dequeueReusableCell(withIdentifier: TableViewCell.identefier, for: indexPath) as?
            TableViewCell else{
         return UITableViewCell()
       }
        cell.setupCell(model: ListViewController.list[indexPath.row])
        print("I'm here")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
  
    }
    
    
}

