//
//  ODRHelper.swift
//  BackgroundRemoval
//
//  Created by Akash Tala on 02/07/2025.
//  Copyright (c) 2025 Akash Tala. All rights reserved.
//

import CoreML

class ODRHelper {
    
    /// Check Avaiblity of model and try to check can we load model currently
    static func loadMLModel(completion: @escaping ((RMBG?, String?) -> Void)) {
        let request = NSBundleResourceRequest(tags: ["RMBG"])
        request.loadingPriority = NSBundleResourceRequestLoadingPriorityUrgent
        Task {
            if await request.conditionallyBeginAccessingResources() {
                self.loadRMBG(completion: { model, error in
                    completion(model, error)
                })
            } else {
                try await request.beginAccessingResources()
                self.loadRMBG(completion: { model, error in
                    completion(model, error)
                })
            }
        }
    }
    
    /// Load Model from provided url
    static func loadRMBG(completion: @escaping ((RMBG?, String?) -> Void)) {
        let bundle = Bundle(for: ODRHelper.self)
        guard let modelURL = bundle.url(forResource: "RMBG", withExtension: "mlmodelc") else {
            completion(nil, "Can't load RMBG model")
            debugPrint("Error: Can't load RMBG Model")
            return
        }
        
        do {
            let config = MLModelConfiguration()
            config.computeUnits = .cpuAndGPU
            let rmbgModel = try RMBG(contentsOf: modelURL, configuration: config)
            completion(rmbgModel, nil)
        } catch {
            debugPrint("Error: \(error.localizedDescription)")
            completion(nil, error.localizedDescription)
        }
    }
}
