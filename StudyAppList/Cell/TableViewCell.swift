//
//  TableViewCell.swift
//  StudyAppList
//
//  Created by Diego Rodrigues on 12/06/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identefier: String = String(describing: TableViewCell.self)
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        AddElements()
        configConstraints()
    }
    
    private func AddElements() {
        addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
        
    }
        
        public func setupCell(model: HomeModel) {
            nameLabel.text = model.name
        }
    
}

