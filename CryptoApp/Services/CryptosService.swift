//
//  CryptosService.swift
//  CryptoApp
//
//  Created by Krystian Grabowy on 12/07/2022.
//

import Foundation

struct CryptosService {
    func parseJSON(data: Data) -> [CryptosCellViewModel] {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([CryptosCellViewModel].self, from: data)
            return decodedData
        } catch {
            print(error)
        }
        return []
    }
}
