//
//  RegisterService.swift
//  SportApp
//
//  Created by Max Khizhniakov on 05.12.2020.
//

import Foundation
import FirebaseAuth
// MARK: - Interface
protocol RegisterServiceProtocol {
    func appleRegistration()
    func fbRegistration()
    func mailRegistration(name: String, mail: String, pass: String, completion: @escaping (Result<String, Error>) -> Void)
}
// MARK: - Implementation
final class RegisterService {
    
}
// MARK: - Extensions
extension RegisterService: RegisterServiceProtocol {
    func appleRegistration() {
        
    }
    func fbRegistration() {
        
    }
    func mailRegistration(name: String, mail: String, pass: String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().createUser(withEmail: mail, password: pass) { (result, error) in
            guard error == nil else { completion(.failure(error!)); return }
            guard let id = result?.user.uid else { return }
            let request = Auth.auth().currentUser?.createProfileChangeRequest()
            request?.displayName = name
            request?.commitChanges(completion: nil)
            completion(.success(id))
        }
    }
}
