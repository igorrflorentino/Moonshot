//
//  AstronautView.swift
//  Moonshot
//
//  Created by Igor Florentino on 02/04/24.
//

import SwiftUI

struct AstronautView: View {
	let astronaut: Astronaut
	
	var body: some View {
		ScrollView {
			VStack {
				Image(astronaut.id)
					.resizable()
					.scaledToFit()
					.accessibilityHidden(true)
				
				Text(astronaut.description)
					.padding()
			}
		}
		.background(.darkBackground)
		.navigationTitle(astronaut.name)
		.navigationBarTitleDisplayMode(.inline)
	}
}

#Preview {
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	
	return NavigationStack{
		AstronautView(astronaut: astronauts["aldrin"]!)
	}
	.preferredColorScheme(.dark)
}
