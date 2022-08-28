//
//  UserDetailTableViewController.swift
//  AccessAppExercise
//
//  Created by 李世文 on 2022/8/28.
//

import UIKit

class UserDetailTableViewController: UITableViewController {
    
    var userName: String!
    
    var vm: UserDetailViewModel?
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var badgeHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var blogLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        populateUserDetail()
        
    }
    
    func setupUI() {
        tableView.showsVerticalScrollIndicator = false
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        badgeLabel.clipsToBounds = true
        badgeLabel.layer.cornerRadius = 16.5
        badgeLabel.layer.opacity = 0
    }
    
    func populateUserDetail() {
        Webservice().load(resource: UserDetailModel.aUser(userName: userName)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let userDetailModel):
                self.vm = UserDetailViewModel(userDetailModel: userDetailModel)
                self.setupData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setupData() {
        guard let vm = vm else { fatalError("vm is nil") }
        
        if vm.site_admin {
            self.badgeLabel.isHidden = false
            badgeLabel.layer.opacity = 1
        } else {
            self.badgeLabel.isHidden = true
            badgeLabel.layer.opacity = 0
        }
        
        nameLabel.text = vm.name
        bioLabel.text = vm.bio
        loginLabel.text = vm.login
        locationLabel.text = vm.location
        blogLabel.text = vm.blog
        
        Webservice().loadImage(url: vm.avatar_url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let image):
                self.avatarImageView.image = image
            case .failure(let error):
                print(error)
            }
        }
    }

}
