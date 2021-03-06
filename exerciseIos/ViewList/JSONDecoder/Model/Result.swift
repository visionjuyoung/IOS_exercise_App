import UIKit

struct Result: Codable {
    static let shared: Result? = Result()
    
    let d: Info
    let i: Info
    let s: Info
    let c: Info
    
    private init?() {
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "Result") else {
            return nil
        }
        
        do {
            let result: Result = try JSONDecoder().decode(Result.self, from: dataAsset.data)
            self = result
        } catch {
            return nil
        }
    }
}

extension Result {
    struct Info: Codable {
        let title: String
        let typeDescription: String
    }
}
