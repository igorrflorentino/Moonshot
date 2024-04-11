//
//  Astronaut.swift
//  Moonshot
//
//  Created by Igor Florentino on 27/03/24.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
	var id: String
	let name: String
	let description: String
}
