//
//  CameraViewModel.swift
//  GooseML
//
//  Created by Kynan Song on 17/05/2022.
//

import Foundation
import UIKit

class CameraViewModel {
    
    var gooseClassifier: GooseClassifier
    
    init() {
        self.gooseClassifier = GooseClassifier()
    }
    
    func identifyGoose(image: UIImage) {
        gooseClassifier.classifyImageRequest(image: image)
    }
    
}
