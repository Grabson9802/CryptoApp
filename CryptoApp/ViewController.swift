//
//  ViewController.swift
//  CryptoApp
//
//  Created by Krystian Grabowy on 12/07/2022.
//

import UIKit

class ViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
    }
}
