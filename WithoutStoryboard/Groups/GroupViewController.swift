//
//  GroupViewController.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 10.08.2023.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    private let networkService = NetworkService()
    private var models: [DataGroups] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
       navigationController?.navigationBar.tintColor = .black
       navigationController?.navigationBar.barTintColor = .white
        // networkService.getGroups()
        //}
        
        tableView.register(TableViewCellGroups.self, forCellReuseIdentifier: "Cell")
        
        
        networkService.getGroups() { [ weak self ] groups in
            self?.models = groups.response.items
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        1
    //    }
    //
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        5
    //    }
    
    //
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        TableViewCellGroups()
    //    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard let cell = cell as? TableViewCellGroups else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.setupTextGroups(group: model)
        return cell
        
    }
}

