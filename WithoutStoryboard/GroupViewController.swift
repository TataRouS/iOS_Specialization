//
//  GroupViewController.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 10.08.2023.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        view.backgroundColor = .white
        tableView.backgroundColor = .white
//        navigationController?.navigationBar.tintColor = .black
//        navigationController?.navigationBar.barTintColor = .white
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        TableViewCellGroups()
    }
}
