//
//  MissionView.swift
//  Moonshot
//
//  Created by Igor Florentino on 02/04/24.
//

import SwiftUI

struct MissionView: View {
	
	let mission: Mission
	let astronauts: [String:Astronaut]
	
	
	var body: some View {
		ScrollView {
			VStack {
				Image(mission.image)
					.resizable()
					.scaledToFit()
					.containerRelativeFrame(.horizontal) { width, axis in
						width * 0.6
					}
					.padding(.top)
				Text(mission.formattedLaunchDate)
					.padding()
				VStack(alignment: .leading) {
					Text("Mission Highlights")
						.font(.title.bold())
						.padding(.bottom, 5)
					Rectangle()
						.frame(height: 2)
						.foregroundStyle(.lightBackground)
						.padding(.vertical)
					Text(mission.description)
					Rectangle()
						.frame(height: 2)
						.foregroundStyle(.lightBackground)
						.padding(.vertical)
				}
				.padding(.horizontal)
				CrewView(mission: mission, astronauts: astronauts)
			}
			.padding(.bottom)
		}
		.navigationTitle(mission.displayName)
		.navigationBarTitleDisplayMode(.inline)
		.background(.darkBackground)
	}
	
	init(mission: Mission, astronauts:[String:Astronaut]) {
		self.mission = mission
		self.astronauts = astronauts
	}
	
}

#Preview {
	let missions: [Mission] = Bundle.main.decode("missions.json")
	let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
	
	return MissionView(mission: missions[1], astronauts:astronauts)
		.preferredColorScheme(.dark)
}
