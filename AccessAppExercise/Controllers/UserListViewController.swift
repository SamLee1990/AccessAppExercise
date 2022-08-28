//
//  UserListViewController.swift
//  AccessAppExercise
//
//  Created by 李世文 on 2022/8/28.
//

import UIKit

class UserListViewController: UIViewController {
    
    var userListViewModel: UserListViewModel?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        populateUsers()
    }
    
    func setupUI() {
        title = "Users"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    func populateUsers() {
        Webservice().load(resource: UserModel.all(since: 0, perPage: 100)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let usersModel):
                self.userListViewModel = UserListViewModel(usersViewModel: usersModel.map(UserViewModel.init))
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension UserListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let userListViewModel = userListViewModel {
            return userListViewModel.usersViewModel.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vm = userListViewModel?.userViewModel(at: indexPath.row) else { fatalError("userListViewModel is nil") }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(UserListTableViewCell.self)", for: indexPath) as? UserListTableViewCell else { fatalError() }
        
        cell.setupUI(login:vm.login, siteAdmin: vm.site_admin, item: indexPath.row + 1)
        
        cell.avatarImageView.image = UIImage(systemName: "person.fill")
        
        Webservice().loadImage(url: vm.avatar_url) { result in
            switch result {
            case .success(let image):
                cell.avatarImageView.image = image
            case .failure(let error):
                print(error)
            }
        }
        
        return cell
    }
    
}

extension UserListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "\(UserDetailTableViewController.self)") as? UserDetailTableViewController else { fatalError() }
        
        controller.userName = userListViewModel?.userViewModel(at: indexPath.row).login

        navigationController?.pushViewController(controller, animated: true)
    }
    
}
