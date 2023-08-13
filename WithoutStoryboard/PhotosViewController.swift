//
//  PhotosViewController.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 10.08.2023.
//

import UIKit
import Foundation


class PhotosViewController: UICollectionViewController {
    
    private var view1: UIImageView = {
        let firstView = UIImageView()
        firstView.backgroundColor =  .magenta
        return firstView
    }()
    
    private var view2: UIImageView = {
        let firstView = UIImageView()
        firstView.backgroundColor =  .systemBlue
        return firstView
    }()
    
    private var view3: UIImageView = {
        let firstView = UIImageView()
        firstView.backgroundColor =  .systemRed
        return firstView
    }()
    
    private var view4: UIImageView = {
        let firstView = UIImageView()
        firstView.backgroundColor =  .darkGray
        return firstView
    }()
    
    private var view5: UIImageView = {
        let firstView = UIImageView()
        firstView.backgroundColor =  .yellow
        return firstView
    }()
    
    private var view6: UIImageView = {
        let firstView = UIImageView()
        firstView.backgroundColor =  .systemBrown
        return firstView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Photos"
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
        view.addSubview(view5)
        view.addSubview(view6)
        setupConstraints()
    }
    
    private func setupConstraints() {
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        view3.translatesAutoresizingMaskIntoConstraints = false
        view4.translatesAutoresizingMaskIntoConstraints = false
        view5.translatesAutoresizingMaskIntoConstraints = false
        view6.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            view1.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            view1.heightAnchor.constraint(equalToConstant: view.frame.size.width/3),
            view1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            view2.topAnchor.constraint(equalTo: view1.topAnchor),
            view2.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view2.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 5),
            
            view3.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 10),
            view3.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view3.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view3.leadingAnchor.constraint(equalTo: view1.leadingAnchor),
            
            view4.topAnchor.constraint(equalTo: view3.topAnchor),
            view4.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view4.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view4.leadingAnchor.constraint(equalTo: view3.trailingAnchor, constant: 5),
            
            view5.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 10),
            view5.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view5.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view5.leadingAnchor.constraint(equalTo: view1.leadingAnchor),
            
            view6.topAnchor.constraint(equalTo: view5.topAnchor),
            view6.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view6.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view6.leadingAnchor.constraint(equalTo: view5.trailingAnchor, constant: 5),
            
        ])
    }
}

