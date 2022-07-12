//
//  CryptosViewController.swift
//  CryptoApp
//
//  Created by Krystian Grabowy on 12/07/2022.
//

import Foundation
import UIKit

class CryptosViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    private var helper = HttpRequestHelper()
    private var cryptosFetchResults = [CryptosCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helper.delegate = self
        helper.performRequest()
        
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension CryptosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptosFetchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cryptosFetchResults[indexPath.row].exchange_id
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CryptosViewController: HttpRequestHelperDelegate {
    func didLoadCryptosData(cryptosData: [CryptosCellViewModel]) {
        cryptosFetchResults = cryptosData
        
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
