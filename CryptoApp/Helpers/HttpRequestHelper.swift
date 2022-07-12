//
//  HttpRequestHelper.swift
//  CryptoApp
//
//  Created by Krystian Grabowy on 12/07/2022.
//

import Foundation

protocol HttpRequestHelperDelegate {
    func didLoadCryptosData(cryptosData: [CryptosCellViewModel])
}

enum HTTPHeaderFields {
    case application_json
}

struct HttpRequestHelper {
    private let urlString = "https://rest.coinapi.io/v1/exchanges?apikey=52B0ADAF-624F-4D38-9090-74C916C93959"
    private let service = CryptosService()
    
    var delegate: HttpRequestHelperDelegate?
    
    func performRequest() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let cryptosData = service.parseJSON(data: safeData)
                    delegate?.didLoadCryptosData(cryptosData: cryptosData)
                }
            }
            task.resume()
        }
    }
}
