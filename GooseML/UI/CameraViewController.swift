//
//  CameraViewController.swift
//  GooseML
//
//  Created by Kynan Song on 17/05/2022.
//

import UIKit

class CameraViewController: UIViewController {
    
    let contentView: CameraView = CameraView()
    var viewModel: CameraViewModel
    
    convenience init() {
        self.init()
        self.viewModel = CameraViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
    }
    
    func setUpCameraView() {
        
    }
    
    func setUpUI() {
        
    }


}

