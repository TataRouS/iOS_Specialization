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
    private var fileCache = FileCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        models = fileCache.fetchGroups()
        tableView.reloadData()
        title = "Groups"
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        // networkService.getGroups()
        //}
        
        tableView.register(TableViewCellGroups.self, forCellReuseIdentifier: "Cell")
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
        getGroups()
    }
    //        networkService.getGroups() { [ weak self ] groups in
    //            self?.models = groups.response.items
    //            DispatchQueue.main.async {
    //                self?.tableView.reloadData()
    //            }
    //        }
    //    }
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
    
    
        func getGroups(){
            networkService.getGroups {[weak self] result in
                switch result {
                case .success(let groups):
                    self?.models = groups.response.items
                    self?.fileCache.addGroups(groups: groups.response.items)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(_):
                    self?.models = self?.fileCache.fetchGroups() ?? []
                    DispatchQueue.main.async {
                        self?.showAlert()
                    }
                }
    
            }
        }
    
    
    @objc func update() {
        networkService.getGroups { [weak self] result in
            switch result {
            case .success(let groups):
                self?.models = groups.response.items
                self?.fileCache.addGroups(groups: groups.response.items)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchGroups() ?? []
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

private extension GroupsViewController {
    func showAlert(){
        let date = DateHelper.getDate(date: fileCache.fetchGroupDate())
        let alert = UIAlertController(title: "Не удалось получить данные",
                                      message: "Данные актуальны на \(date)",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}




