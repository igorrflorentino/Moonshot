//
//  FileManager-Decodable.swift
//  Moonshot
//
//  Created by Igor Florentino on 10/06/24.
//

import Foundation

extension FileManager {
	func decode<T: Codable>(_ fileName: String) -> T {
		
		let documentDirectory = self.urls(for: .documentDirectory, in: .userDomainMask).first!
		let fileURL = documentDirectory.appendingPathComponent(fileName)
		
		guard let data = try? Data(contentsOf: fileURL) else {
			fatalError("Failed to load \(fileName) from documents directory")
		}
		
		let decoder = JSONDecoder()
		
		let formatter = DateFormatter()
		formatter.dateFormat = "y-MM-dd"
		decoder.dateDecodingStrategy = .formatted(formatter)
		
		guard let decodedData = try? decoder.decode(T.self, from: data) else {
			fatalError("Failed to decode \(fileName) from documents directory")
		}
		
		return decodedData
	}
}
