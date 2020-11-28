//
//  ProfileView.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit
import SnapKit

final class ProfileView: BaseView {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profile")
        return view
    }()

    override func prepareView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide).inset(40.0)
        }
    }
}
