//
//  NetworkService.swift
//  SportApp
//
//  Created by Max Khizhniakov on 05.12.2020.
//

import Foundation
import Firebase
import FirebaseAuth
// MARK: - NetworkServiceErrors
enum NetworkError: Error {
    case internetConnection, connectionServiceDisabled
}

// MARK: - Interface
protocol NetworkServiceProtocol: class {
    var connectionService: ConnectionServiceProtocol? { get }
    var registerService: RegisterServiceProtocol? { get }
    var firebaseService: FirebaseServiceProtocol? { get }
    
    @discardableResult
    func configureFirebase() -> Result<Bool, NetworkError>
    func isLoggedIn() -> Result<Bool, NetworkError>
}

// MARK: - Implementation
final class NetworkService: NetworkServiceProtocol {
    // MARK: - Properties
    var connectionService: ConnectionServiceProtocol?
    var registerService: RegisterServiceProtocol?
    var firebaseService: FirebaseServiceProtocol?
    
    // MARK: - Methods
    @discardableResult
    func configureFirebase() -> Result<Bool, NetworkError> {
        guard let connectionService = connectionService else { return .failure(.connectionServiceDisabled) }
        guard connectionService.isConnectionEnabled() else { return .failure(.internetConnection) }
        FirebaseApp.configure()
        return .success(true)
    }
    func isLoggedIn() -> Result<Bool, NetworkError> {
        guard let connectionService = connectionService else { return .failure(.connectionServiceDisabled) }
        guard connectionService.isConnectionEnabled() else { return .failure(.internetConnection) }
        guard Auth.auth().currentUser != nil else { return .success(false) }
        return .success(true)
    }
}
