//
//  ProfileCell.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 21.08.2023.
//

import UIKit

final class ProfileCell: UITableViewCell {
    
    private var circle = UIImageView(image: UIImage(systemName: "person"))
    
    
    private var text: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private var onlineCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = 10
        return circle
    }()
    
    func setupTextProfile(profile: Profile) {
        text.text = (profile.myFirstName ?? "") + " " + (profile.myLastName ?? "")
    }
        
    func DispatchQueue.global ().async {
            if let url = URL (string: profile.myAvatar ?? ""), let data = try?
                Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.circle.image = UIImage(data: data)
                }
            }
        }
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupViews() {
        contentView.addSubview(circle)
        contentView.addSubview(text)
        setupConstraints()
    }
    
    private func setupConstraints() {
        circle.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            circle.heightAnchor.constraint(equalToConstant: 50),
            circle.widthAnchor.constraint(equalTo: circle.heightAnchor),
            
            onlineCircle.widthAnchor.constraint(equalToConstant: 20),
            onlineCircle.heightAnchor.constraint(equalTo: onlineCircle.widthAnchor),
            onlineCircle.bottomAnchor.constraint(equalTo: circle.bottomAnchor),
            onlineCircle.trailingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 10),
            
            text.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            text.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 30),
            text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
            
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        text.text = nil
    }
}


