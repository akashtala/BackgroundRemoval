//
//  BGRemover.swift
//  BackgroundRemoval
//
//  Created by Akash Tala on 02/07/2025.
//  Copyright (c) 2025 Akash Tala. All rights reserved.
//

public class BGRemover {
    public init() { }
    
    public func removeBackground(from image: UIImage, success: @escaping ((UIImage) -> Void), failure: @escaping ((String) -> Void)) {
        ODRHelper.loadMLModel(completion: { model, error in
            guard let model = model else {
                failure(error ?? "")
                return
            }
            guard let pixelBuffer = image.getImageBuffer() else {
                failure("Can't convert image to pixel buffer")
                return
            }
            do {
                let prediction = try model.prediction(image: pixelBuffer)
                let ciImage = CIImage(cvPixelBuffer: prediction.output)
            } catch {
                
            }
        })
    }
}
