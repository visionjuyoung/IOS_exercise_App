//
//  AnimalInfo.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/25.
//

import UIKit
struct AnimalInfo: Codable {
    let name: String
    let animalDescription: String
    var imageName: String
    
    static func decode(from assetName: String) -> AnimalInfo? {
        guard let asset: NSDataAsset = NSDataAsset(name: assetName) else {
            print("asset load fail")
            return nil
        }
        do {
            let decoder: PropertyListDecoder = PropertyListDecoder()
            return try decoder.decode(AnimalInfo.self, from: asset.data)
        } catch {
            print("data decodeing fail")
            print(error.localizedDescription)
            return nil
        }
    }
}
