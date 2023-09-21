//
//  TableViewController.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 10.08.2023.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var models: [DataFriend] = []
    private var fileCache = FileCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        models = fileCache.fetchFriends()
        tableView.reloadData()
        title = "Friends"
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person") , style: .plain, target: self, action: #selector(tapprofile))
        
        tableView.register(TableViewCellFriends.self, forCellReuseIdentifier: "FriendsCell")
        
        
        //  networkService.getFriends()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
        getFriends()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.reloadData()
    }
    
    //        networkService.getFriends() { [ weak self ] friendsList in
    //            self?.models = friendsList
    //            DispatchQueue.main.async {
    //                self?.tableView.reloadData()
    //            }
    //        }
    //    }
    
    
    //    private extension FriensdViewController {
    //        @objc func tapprofile() {
    //            let animation = CATransition()
    //            animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
    //            animation.type = .moveIn
    //            animation.duration = 3
    //            navigationController?.view.layer.add(animation, forKey: nil)
    //            navigationController?.pushViewController(ProfileViewController(name: "MyName", myAvatar: UIImage(systemName: "person") ), animated: true)
    //        }
    
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
        cell.tap = { [weak self] text, avatar in
            self?.navigationController?
                .pushViewController(ProfileViewController(name: text, myAvatar: avatar, isUserProfile: false), animated: true)
            
        }
        return cell
        
        //        cell.setupTextFriends(friend: model)
        //        return cell
    }
    
    func getFriends(){
        networkService.getFriends {[weak self] result in
            switch result {
            case .success(let friendsList):
                self?.models = friendsList
                self?.fileCache.addFriends(friends: friendsList)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchFriends() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
            
        }
    }
    
}

private extension FriendsViewController {
    @objc func tapprofile() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.type = .moveIn
        animation.duration = 3
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.pushViewController(ProfileViewController(isUserProfile: true), animated: false)
        
        //        navigationController?.pushViewController(ProfileViewController(name: "MyName", myAvatar: UIImage(systemName: "person") ), animated: true)
    }
    
    @objc func update() {
        networkService.getFriends { [weak self] result in
            switch result {
            case .success(let friendsList):
                self?.models = friendsList
                self?.fileCache.addFriends(friends: friendsList)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchFriends() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
            DispatchQueue.main.async {
                self?.refreshControl?.endRefreshing()
            }
        }
    }
}

private extension FriendsViewController {
    func showAlert(){
        let date = DateHelper.getDate(date: fileCache.fetchFriendDate())
        let alert = UIAlertController(title: "Не удалось получить данные",
                                      message: "Данные актуальны на \(date)",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

