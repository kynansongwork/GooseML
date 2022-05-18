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
    
    var cameraView: UIImageView = {
        let temp = UIImageView()
        return temp
    }()
    
    var imagePickerButton: UIButton = {
        let temp = UIButton()
        temp.setImage(UIImage(systemName: "camera")
                      , for: .normal)
        return temp
    }()
    
    var imageIdentifier: UILabel = {
        let temp = UILabel()
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
        self.addSubview(imagePickerButton)
        self.backgroundColor = .white
        
        cameraView.centerInSuperview()
        cameraView.height(500)
        cameraView.width(400)
        cameraView.backgroundColor = .black
        
        imagePickerButton.height(30)
        imagePickerButton.width(30)
        imagePickerButton.edgesToSuperview(excluding: [.bottom, .left], insets: TinyEdgeInsets(top: 80, left: 0, bottom: 0, right: 10))
        
        
        
        
        
    }
    
}
