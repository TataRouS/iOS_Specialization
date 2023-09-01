//
//  ProfileViewController.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 19.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    private var nameLebel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        //  label.text = "Name"
        return label
    }()
    private var profileImageView = UIImageView()
    private var themeView = ThemeView()
    private var isUserProfile: Bool
    
    init (name: String? = nil, myAvatar: UIImage? = nil, isUserProfile: Bool){
        self.isUserProfile = isUserProfile
        super.init(nibName: nil, bundle: nil)
        nameLebel.text = name
        profileImageView.image = myAvatar
        themeView.delegate = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        setupViews()
        if isUserProfile {
            networkService.getProfileInfo { [weak self] profile in self?.updateData(model: profile)
            }
        } else {
        themeView.isHidden = true
            //
//        title = "Profile"
//        view.backgroundColor = .white
//        navigationController?.navigationBar.tintColor = .black
//        navigationController?.navigationBar.barTintColor = .darkGray
//        setupViews()
//
//        networkService.getProfileInfo() { [ weak self ] profile in
//            self?.updateData(model: profile)
        }
    }
    
    func updateData (model: ProfileModel?) {
        guard let model = model else {return}
        DispatchQueue.global().async {
            if let url = URL(string: model.response.myAvatar ?? " "),
               let data = try? Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.profileImageView.image = UIImage(data: data)
                }
            }
        }
        DispatchQueue.main.async {
            self.nameLebel.text = (model.response.myFirstName ?? "") + "" +
            (model.response.myLastName ?? "")
        }
    }
    
    
    
    private func setupViews() {
        view.addSubview(nameLebel)
        view.addSubview(profileImageView)
        view.addSubview(themeView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameLebel.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        themeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLebel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLebel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            nameLebel.heightAnchor.constraint(equalToConstant: view.frame.size.width/3),
            nameLebel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            profileImageView.topAnchor.constraint(equalTo:  nameLebel.topAnchor),
            profileImageView.widthAnchor.constraint(equalTo: nameLebel.widthAnchor),
            profileImageView.heightAnchor.constraint(equalTo:  nameLebel.heightAnchor),
            profileImageView.leadingAnchor.constraint(equalTo:  nameLebel.trailingAnchor, constant: 5),
            
            themeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            themeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            themeView.topAnchor.constraint(equalTo: nameLebel.bottomAnchor, constant: 30),
            themeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            
        ])
    }
}

extension ProfileViewController: ThemeViewDelegate {
    func updateColor() {
        view.backgroundColor = Theme.currentTheme.backgroundColor
        nameLebel.textColor =  Theme.currentTheme.textColor
    }
}
