//
//  Coordinator.swift
//  CryptoApp
//
//  Created by Krystian Grabowy on 12/07/2022.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var navigationController: UINavigationController? {get set}
    
    func eventOccured(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? {get set}
}
