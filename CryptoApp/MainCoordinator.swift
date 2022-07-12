//
//  MainCoordinator.swift
//  CryptoApp
//
//  Created by Krystian Grabowy on 12/07/2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func eventOccured(with type: Event) {
        
    }
    
    func start() {
        var vc: UIViewController & Coordinating = ViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}
