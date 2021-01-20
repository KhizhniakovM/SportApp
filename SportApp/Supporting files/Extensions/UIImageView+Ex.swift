//
//  UIImageView+Ex.swift
//  SportApp
//
//  Created by Max Khizhniakov on 20.01.2021.
//

import UIKit
import FirebaseStorage
import SDWebImage

extension UIImageView {
    func downloadImage(for path: String, ref: StorageReference) {
        Storage.storage().reference(withPath: path).downloadURL { (url, error) in
            guard error == nil else { print(error!.localizedDescription); return }
            self.sd_setImage(with: url) { (image, error, _, _) in
                guard error == nil else { print(error!.localizedDescription) ; return }
                self.image = image
            }
        }
    }
}
