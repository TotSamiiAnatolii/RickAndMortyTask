//
//  DateFormatter+.swift
//  RickAndMortyTask
//
//  Created by APPLE on 21.08.2023.
//

import Foundation

extension String {
    
    func toDateString(_ inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ", _ outputFormat: String = "MMM d, yyyy" ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: date ?? Date())
    }
}
