//
//  TableViewController.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 10.08.2023.
//

import UIKit

class FriensdViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var models: [DataFriend] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        //  networkService.getFriends()
        tableView.register(TableViewCellFriends.self, forCellReuseIdentifier: "FriendsCell")
        networkService.getFriends() { [ weak self ] friendsList in
            self?.models = friendsList
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  TableViewCellFriends()
 //       let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath)
 //       let model = models[indexPath.row]
 //       guard let cell = cell as? TableViewCellFriends else {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? TableViewCellFriends else {
        return UITableViewCell()
        }
        
        let model = models[indexPath.row]
        cell.setupTextFriends(friend: model)
        return cell
        
//        cell.setupTextFriends(friend: model)
//        return cell
    }
}

