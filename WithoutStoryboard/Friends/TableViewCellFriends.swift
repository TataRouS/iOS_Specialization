//
//  CustomTableViewCell.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 10.08.2023.
//

import UIKit

final class TableViewCellFriends: UITableViewCell {
    
    var tap: ((String?, UIImage?) -> Void)?
    
    private var circle = UIImageView(image: UIImage(systemName: "person"))
    
    //    private var circle: UIView = {
    //        let circle = UIView()
    //        circle.backgroundColor = .magenta
    //        circle.layer.cornerRadius = 25
    //        return circle
    //    }()
    //
    //    private var text1: UILabel = {
    //        let label = UILabel()
    //        label.text = "Nickname"
    //        label.textColor = .black
    //        return label
    //    }()
    //
    //    private var text2: UILabel = {
    //        let label = UILabel()
    //        label.text = "Name"
    //        label.textColor = .black
    //        return label
    //    }()
    //
    //    private var text3: UILabel = {
    //        let label = UILabel()
    //        label.text = "LastName"
    //        label.textColor = .black
    //        return label
    //    }()
    //
    //    private var text4: UILabel = {
    //        let label = UILabel()
    //        label.text = "Online"
    //        label.textColor = .black
    //        return label
    //    }()
    //
    
    
    private var text: UILabel = {
        let label = UILabel()
        label.textColor = Theme.currentTheme.textColor
        return label
    }()
    
    private var onlineCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = 10
        return circle
    }()
    
    func setupTextFriends(friend: DataFriend) {
        text.text = (friend.firstName ?? "") + " " + (friend.lastName ?? "")
        if let online = friend.online {
            let isOnline = online == 1
            if isOnline {
                onlineCircle.backgroundColor = .green
            } else {
                onlineCircle.backgroundColor = .red
            }
        }
        
        DispatchQueue.global ().async {
            if let url = URL (string: friend.avatar ?? ""), let data = try?
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
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellClick))
        addGestureRecognizer(recognizer)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    private func setupViews() {
        contentView.addSubview(circle)
        contentView.addSubview(text)
        circle.addSubview(onlineCircle)
        //        contentView.addSubview(text2)
        //        contentView.addSubview(text3)
        //        contentView.addSubview(text4)
        setupConstraints()
    }
    
    private func setupConstraints() {
        circle.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        onlineCircle.translatesAutoresizingMaskIntoConstraints = false
        
        //        text1.translatesAutoresizingMaskIntoConstraints = false
        //        text2.translatesAutoresizingMaskIntoConstraints = false
        //        text3.translatesAutoresizingMaskIntoConstraints = false
        //        text4.translatesAutoresizingMaskIntoConstraints = false
        //
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
            
            //            circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //            circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            //            circle.heightAnchor.constraint(equalToConstant: 50),
            //            circle.widthAnchor.constraint(equalTo: circle.heightAnchor),
            //            circle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            //
            //            text1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            //            text1.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 30),
            //            text1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            //
            //            text2.topAnchor.constraint(equalTo: text1.topAnchor, constant: 20),
            //            text2.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 30),
            //            text2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            //
            //
            //            text3.topAnchor.constraint(equalTo: text2.topAnchor, constant: 20),
            //            text3.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 30),
            //            text3.trailingAnchor.constraint(equalTo: text2.trailingAnchor),
            //
            //            text4.topAnchor.constraint(equalTo: text3.topAnchor, constant: 20),
            //            text4.leadingAnchor.constraint(equalTo: text3.leadingAnchor),
            //            text4.trailingAnchor.constraint(equalTo: text3.trailingAnchor),
            //            text4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        text.text = nil
    }
    
    @objc private func cellClick() {
        tap?(text.text, circle.image)
    }
    
}

