//
//  CameraView.swift
//  GooseNotGoose
//
//  Created by Kynan Song on 17/05/2022.
//

import Foundation
import UIKit
import TinyConstraints

class CameraView: UIView {
    
    var cameraView: UIView = {
        let temp = UIView()
        return temp
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        self.addSubview(cameraView)
        cameraView.centerInSuperview()
        cameraView.height(200)
        cameraView.width(100)
        cameraView.backgroundColor = .black
    }
    
}
