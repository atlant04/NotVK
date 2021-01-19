//
//  UIImageView+LoadURL.swift
//  NetologiaAssignment
//
//  Created by MacBook on 1/19/21.
//

import UIKit

//для загрузки фоток по url, максимально просто, но жутко неэффективно
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else { return }

            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}
