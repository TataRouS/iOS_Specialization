//
//  ProfileViewController.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 19.08.2023.
//

import UIKit

class ProfileViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var models: Profile
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .darkGray
      
        
        //  networkService.getFriends()
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "ProfileCell")
        networkService.getProfileInfo() { [ weak self ] profile in
            self?.models = profile
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  TableViewCellFriends()
 //       let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath)
 //       let model = models[indexPath.row]
 //       guard let cell = cell as? TableViewCellFriends else {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileCell else {
        return UITableViewCell()
        }
        
        let model = models
        cell.setupTextProfile(profile: model)
        return cell
        
//        cell.setupTextFriends(friend: model)
//        return cell
    }
}

