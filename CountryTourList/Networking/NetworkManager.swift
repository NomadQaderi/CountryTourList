//
//  NetworkManager.swift
//  TourList
//
//  Created by NOMAD on 9/19/22.
//

import Foundation

final class NetworkManager {
  
    static let shared = NetworkManager()
    
    func fetchCountriesInformation (completion: @escaping ([DataModel]) -> ()) {
        
        let baseURL = "http://api.countrylayer.com/v2/all?access_key=73f3380e434f36e04afac622cda79be6"
        guard let url = URL(string: baseURL) else { return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Data was nil")
                return
            }
            
            guard let decodedDataModel = try? JSONDecoder().decode([DataModel].self, from: data) else {
                print("Could not decod json")
                return
            }
            
            completion(decodedDataModel)
        }
        task.resume()
    }
}
