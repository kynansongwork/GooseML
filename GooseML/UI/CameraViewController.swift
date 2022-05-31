//
//  CameraViewController.swift
//  GooseML
//
//  Created by Kynan Song on 17/05/2022.
//

import UIKit
import Combine

class CameraViewController: UIViewController {
    
    private var subscriptions = Set<AnyCancellable>()
    
    let contentView: CameraView = CameraView()
    let viewModel: CameraViewModel = CameraViewModel()
    
    override func loadView() {
        view = contentView
        bindView()
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel.gooseClassifier.passthrough
            .sink { [weak self] value in
                print("Is this a goose: \(value)")
                
                //TODO: Change this to copmbine way of doing async.
                DispatchQueue.main.async {
                    self?.contentView.imageLabel.text = value
                }
                
        }.store(in: &subscriptions)
    }
    
    func bindView() {
        contentView.imagePickerButton.publisher(for: .touchUpInside)
                .sink { [weak self] _ in
                    print("Button Tapped")
                    self?.selectImage()
                }.store(in: &subscriptions)
    }
    
    func selectImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.modalPresentationStyle = .overFullScreen
        present(imagePicker, animated: true)
    }
}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            contentView.cameraView.image = pickedImage
            
            //Classify image here
            viewModel.identifyGoose(image: pickedImage)
        }
    }
    
}

