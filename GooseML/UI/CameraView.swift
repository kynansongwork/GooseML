//
//  CameraView.swift
//  GooseML
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
        self.backgroundColor = .white
        cameraView.centerInSuperview()
        cameraView.height(500)
        cameraView.width(400)
        cameraView.backgroundColor = .black
        
    }
    
}
