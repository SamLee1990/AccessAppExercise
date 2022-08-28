//
//  UserListTableViewCell.swift
//  AccessAppExercise
//
//  Created by 李世文 on 2022/8/28.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var badgeLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var numberOfItemLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI() {
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowOffset = CGSize(width: 1, height: 1)
        avatarImageView.layer.cornerRadius = 30
        badgeLabel.clipsToBounds = true
        badgeLabel.layer.cornerRadius = 16.5
    }
    
    func setupUI(login: String, siteAdmin: Bool, item: Int) {
        loginLabel.text = login
        if siteAdmin {
            badgeLabelHeightConstraint.constant = 33
        } else {
            badgeLabelHeightConstraint.constant = 0
        }
        numberOfItemLabel.text = "Item: \(item)"
        
    }

}
