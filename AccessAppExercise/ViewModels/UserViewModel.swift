//
//  UserListViewModel.swift
//  AccessAppExercise
//
//  Created by 李世文 on 2022/8/28.
//

import Foundation

struct UserViewModel {
    let userModel: UserModel
}

extension UserViewModel {
    
    var login: String {
        return userModel.login
    }
    
    var avatar_url: URL? {
        return URL(string: userModel.avatar_url)
    }
    
    var site_admin: Bool {
        return userModel.site_admin
    }
    
}

struct UserListViewModel {
    let usersViewModel: [UserViewModel]
}

extension UserListViewModel {
    
    func userViewModel(at index: Int) -> UserViewModel {
        return usersViewModel[index]
    }
    
}
