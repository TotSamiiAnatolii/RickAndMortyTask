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
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    func startMonitoring() {
        
    }
    
    func stopMonitoring() {
        
    }
}
