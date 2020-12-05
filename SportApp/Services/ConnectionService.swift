//
//  ConnectionService.swift
//  SportApp
//
//  Created by Max Khizhniakov on 05.12.2020.
//

import UIKit
import Network

// MARK: - Interface
protocol ConnectionServiceProtocol {
    func isConnectionEnabled() -> Bool
}

// MARK: - Implementation
class ConnectionService {
    // MARK: - Properties
    private var monitor: NWPathMonitor = NWPathMonitor()
    private var isNetworkEnabled: Bool?
    
    // MARK: - Inintializer
    init() {
        startMonitoring()
    }
    
    // MARK: - Methods
    private func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            if path.status != .satisfied {
                DispatchQueue.main.async {
                    self?.isNetworkEnabled = false
                }
            } else if path.status == .satisfied {
                DispatchQueue.main.async {
                    self?.isNetworkEnabled = true
                }
            }
        }
        let monitorQueue = DispatchQueue(label: "Monitor")
        monitor.start(queue: monitorQueue)
    }
}
// MARK: - Extensions
extension ConnectionService: ConnectionServiceProtocol {
    func isConnectionEnabled() -> Bool {
        if let isNetworkEnabled = isNetworkEnabled {
            return isNetworkEnabled
        } else {
            return true
        }
    }
}
