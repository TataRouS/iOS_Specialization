//
//  ViewController.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 03.08.2023.
//

import UIKit

class LoginViewController: UIViewController {

    // Лейбл
    private var label: UILabel = {
        let label = UILabel()
        label.text = "VK"
        label.textAlignment = .center
        label.backgroundColor = .gray
        return label
    }()
    
    
    
    //Авторизация
    private var label2: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.textAlignment = .center
        label.backgroundColor = .gray
        return label
    }()
    
    //Текстовое поле логин
    private var login: UIInputView = {
        let login = UIInputView()
        login.backgroundColor = .gray
        return login
    }()
    
    //Текстовое поле Пароль

    private var login: UITextField = {
        let login = UITextField()
        login.backgroundColor = .gray
        return login
    }()
    
    //Кнопка входа
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Вход", for: .normal)
        button.setTitleColor(.magenta, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .gray
        return button
    }()
    
    private func setupViews() {
        view.addSubview(label)
        view.addSubview(label2)
        view.addSubview(login)
        view.addSubview(button)
        
        setupConstraints()
    }
    
    //настройка констрейнт
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
            label.heightAnchor.constraint(equalToConstant: view.frame.size.width/4),
            
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
            label.heightAnchor.constraint(equalToConstant: view.frame.size.width/4),
            
            login.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 20),
            login.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            login.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
            login.heightAnchor.constraint(equalToConstant: view.frame.size.width/4),
            
           button.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: view.frame.size.width/1.5),
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

