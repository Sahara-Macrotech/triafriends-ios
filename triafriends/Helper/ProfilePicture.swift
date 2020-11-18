//
//  ProfilePicture.swift
//  triafriends
//
//  Created by Arie May Wibowo on 18/11/20.
//

import SwiftUI
import UIKit


class ProfilePicture: ObservableObject {
    
    @Published var profpic: UIImage?
    
    func getProfPic(completion: @escaping ((Data) -> Void)) {
        var profileImage: Data = Data()
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global(qos: .userInteractive).async(group: group) {
            if UserDefaults.standard.data(forKey: "profilepicture") != nil {
                profileImage = UserDefaults.standard.data(forKey: "profilepicture")!
            }
            group.leave()
        }
        group.notify(queue: .main) {
            completion(profileImage)
        }
    }
    
    init() {
        getProfPic(completion: {
            image in self.profpic = UIImage(data: image)
        })
    }
    
}
