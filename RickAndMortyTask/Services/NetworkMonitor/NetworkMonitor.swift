//
//  NetworkMonitor.swift
//  RickAndMortyTask
//
//  Created by APPLE on 07.09.2023.
//

import Foundation
import Network

protocol NetworkMonitorProtocol {
    
    func startMonitoring()
    func stopMonitoring()
}

final class NetworkMonitor: NetworkMonitorProtocol {
    
    static let shared = NetworkMonitor()
    
    public private(set) var isConnected: Bool = false
    
    private let monitor: NWPathMonitor
    
    private let queue = DispatchQueue.global(qos: .userInitiated)
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = {[weak self] path in
            self?.isConnected = path.status != .unsatisfied
        }
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}
