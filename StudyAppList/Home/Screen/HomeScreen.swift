//
//  HomeScreen.swift
//  StudyAppList
//
//  Created by Diego Rodrigues on 12/06/23.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedAddButton(text: String)
}

class HomeScreen: UIView {
   
    private weak var delegate: HomeScreenProtocol?
    
    public func setDelegate(delegate: HomeScreenProtocol) {
        self.delegate = delegate
    }
        
        lazy var imageView: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(systemName: "rectangle.and.pencil.and.ellipsis.rtl")
            image.tintColor = UIColor.black
            image.contentMode = .scaleAspectFit
            image.clipsToBounds = true
            image.layer.cornerRadius = 20
            return image
            
        }()
        
        lazy var textField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.backgroundColor = .white
            textField.placeholder = ""
            textField.clipsToBounds = true
            textField.layer.cornerRadius = 8
            return textField
            
        }()
        
        lazy var addButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Adiciona", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.setTitleColor(.black, for: .normal)
            button.clipsToBounds = true
            button.layer.cornerRadius = 8
            button.backgroundColor = .white
            button.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
            return button
        }()
        
        @objc public func tappedAddButton() {
            let text = textField.text ?? ""
            delegate?.tappedAddButton(text: text)
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            addElements()
            configConstraints()
        }
        
        private func addElements() {
            addSubview(imageView)
            addSubview(textField)
            addSubview(addButton)
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configConstraints() {
            NSLayoutConstraint.activate([
                
                imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 130),
                imageView.widthAnchor.constraint(equalToConstant: 150),
                imageView.heightAnchor.constraint(equalToConstant: 150),
                imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                textField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
                textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
                textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                textField.heightAnchor.constraint(equalToConstant: 30),
                
                addButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30),
                addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
                addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150),
                addButton.heightAnchor.constraint(equalToConstant: 30),
                
            ])
        }
        
    }
    
