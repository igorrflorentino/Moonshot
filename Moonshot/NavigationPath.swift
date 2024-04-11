//
//  NavigationPath.swift
//  Moonshot
//
//  Created by Igor Florentino on 05/04/24.
//

import SwiftUI

@Observable
class PathStore {
	var path: NavigationPath {
		didSet {
			save()
		}
	}
	
	private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
	
	init() {
		if let data = try? Data(contentsOf: savePath) {
			if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
				path = NavigationPath(decoded)
				return
			}
		}
		
		// Still here? Start with an empty path.
		print("navigation path not loaded")
		path = NavigationPath()
	}
	
	func save() {
		guard let representation = path.codable else { return }
		do {
			let data = try JSONEncoder().encode(representation)
			try data.write(to: savePath)
		} catch {
			print("Failed to save navigation data")
		}
	}
}
