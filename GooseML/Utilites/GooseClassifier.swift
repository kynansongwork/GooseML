//
//  GooseClassifier.swift
//  GooseML
//
//  Created by Kynan Song on 17/05/2022.
//

import Foundation
import CoreImage
import CoreML
import Vision
import UIKit
import Combine

class GooseClassifier {
    
    var passthrough = PassthroughSubject<String, Never>()
    
    let model: BirdModel = {
        do {
            let config = MLModelConfiguration()
            return try BirdModel(configuration: config)
        } catch {
            print(error)
            fatalError("Couldn't create BirdModel")
        }
    }()
    
    private lazy var classificationRequest: VNCoreMLRequest = {

        do {
            // Creating the instance of a model.
            let birdModel = try VNCoreMLModel(for: model.model)
            // Instantiate image analysis request object based on the model.
            let request = VNCoreMLRequest(model: birdModel) { request, _ in
                if let classifications = request.results! as? [VNClassificationObservation] {
                    print("Classification results: \(classifications.first)")
                    
                    if let foundItem = classifications.first?.identifier.lowercased() {
                        if foundItem.contains("anser") {
                            self.passthrough.send(foundItem)
                        } else {
                            self.passthrough.send("Not a goose")
                        }
                    }
                }
            }
            // Uisng vision to crop the request.
            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to load model \(error)")
        }
    }()
    
    // Integrating the request
    func classifyImageRequest(image: UIImage) {
        
        let orientationValue = UInt32(image.imageOrientation.rawValue)
        guard let imageOrientation = CGImagePropertyOrientation(rawValue: orientationValue) else { return }
        
        guard let ciImage = CIImage(image: image) else {
            fatalError("Unable to create \(CIImage.self) from \(image).")
        }
        
        // Starts async classification request.
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: imageOrientation)
            
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                print("Failed to perform clasification: \(error.localizedDescription)")
            }
        }
    }
}
