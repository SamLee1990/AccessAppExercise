//
//  UserDetailViewModel.swift
//  AccessAppExercise
//
//  Created by 李世文 on 2022/8/28.
//

import Foundation

struct UserDetailViewModel {
    let userDetailModel: UserDetailModel
}

extension UserDetailViewModel {
    
    var login: String {
        return userDetailModel.login
    }
    
    var avatar_url: URL? {
        return URL(string: userDetailModel.avatar_url)
    }
    
    var name: String {
        return userDetailModel.name ?? ""
    }
    
    var bio: String {
        return userDetailModel.bio ?? ""
    }
    
    var site_admin: Bool {
        return userDetailModel.site_admin
    }
    
    var location: String {
        return userDetailModel.location ?? ""
    }
    
    var blog: String {
        return userDetailModel.blog ?? ""
    }
    
}
