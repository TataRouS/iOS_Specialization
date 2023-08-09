//
//  ViewController.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 03.08.2023.
//

import UIKit

class LoginViewController: UIViewController {

    // Лейбл
    private var imageView = UIImageView(image: UIImage(systemName: "network"))
    
    //Авторизация
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.textAlignment = .center
        label.font = UIFont(name:"Papyrus", size: 24)
        label.textColor = .systemBlue
        label.backgroundColor = .white
        return label
    }()
    
    //Текстовое поле логин
    private var login: UITextField = {
        let login = UITextField()
        login.borderStyle = .line
        login.layer.borderWidth = 1
        login.layer.borderColor = UIColor.gray.cgColor
        login.textColor = .black
        login.backgroundColor = .white
        let placeholderText = NSAttributedString(string: "Логин", attributes: [NSAttributedString.Key.foregroundColor:UIColor.systemBlue])
        login.attributedPlaceholder = placeholderText
        return login
    }()
    
    //Текстовое поле Пароль
    private var password: UITextField = {
        let password = UITextField()
        password.borderStyle = .line
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.gray.cgColor
        password.textColor = .black
        password.backgroundColor = .white
        let placeholderText = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor:UIColor.systemBlue])
        password.attributedPlaceholder = placeholderText
        return password
    }()
    
    //Кнопка входа
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Вход", for: .normal)
        button.setTitleColor(.magenta, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .white
        return button
    }()
    
    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(login)
        view.addSubview(password)
        view.addSubview(button)
        
        setupConstraints()
    }
    
    //настройка констрейнт
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        login.translatesAutoresizingMaskIntoConstraints = false
        password.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
  
            
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.size.width/3.5),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.size.width/3.5),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            label.heightAnchor.constraint(equalToConstant: 100),
            
            login.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            login.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            login.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            login.heightAnchor.constraint(equalToConstant: 50),
            
            password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 10),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            password.heightAnchor.constraint(equalToConstant: 50),
            
            button.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: view.frame.size.width/4),
            button.heightAnchor.constraint(equalToConstant: view.frame.size.width/4),
    
        ])
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        // Do any additional setup after loading the view.
        setupViews()
    }


}

