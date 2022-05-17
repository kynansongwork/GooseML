//
//  CameraViewController.swift
//  GooseML
//
//  Created by Kynan Song on 17/05/2022.
//

import UIKit

class CameraViewController: UIViewController {
    
    let contentView: CameraView = CameraView()
    let viewModel: CameraViewModel = CameraViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
    }
    
    func setUpCameraView() {
        
    }
    
    func setUpUI() {
        
    }


}

