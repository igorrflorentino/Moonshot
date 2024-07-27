//
//  CrewView.swift
//  Moonshot
//
//  Created by Igor Florentino on 02/04/24.
//

import SwiftUI

struct CrewView: View {
	
	struct CrewMember: Hashable {
		let role: String
		let astronaut: Astronaut
	}
	
	let crew: [CrewMember]
	
	let mission: Mission
	
	var body: some View {
		VStack{
			Text("Crew")
				.font(.title.bold())
				.padding(.horizontal, 15)
				.frame(maxWidth: .infinity, alignment: .leading)
			
			ScrollView(.horizontal, showsIndicators: false) {
				LazyHStack {
					ForEach(crew, id: \.role) { crewMember in
						NavigationLink(value: crewMember){
							HStack {
								Image(crewMember.astronaut.id)
									.resizable()
									.frame(width: 104, height: 72)
									.clipShape(.capsule)
									.overlay(
										Capsule()
											.strokeBorder(.white, lineWidth: 1)
									)
								
								VStack(alignment: .leading) {
									Text(crewMember.astronaut.name)
										.foregroundStyle(.white)
										.font(.headline)
									Text(crewMember.role)
										.foregroundStyle(.white.opacity(0.5))
								}
							}
							.padding(.horizontal)
						}
						.accessibilityElement(children: .ignore)
						.accessibilityLabel(crewMember.astronaut.name.replacingOccurrences(of: ".", with: " "))
						.accessibilityHint(crewMember.role)
					}
				}
			}
		}
		.background(.darkBackground)
		.navigationDestination(for: CrewMember.self) { crewMemeber in
			AstronautView(astronaut: crewMemeber.astronaut)
		}
	}
	
	init(mission: Mission, astronauts:[String:Astronaut]) {
		self.mission = mission
		self.crew = mission.crew.map { member in
			if let astronaut = astronauts[member.name] {
				return CrewMember(role: member.role, astronaut: astronaut)
			} else {
				fatalError("Missing \(member.name)")
			}
		}

	}
}

#Preview {
	let missions: [Mission] = Bundle.main.decode("missions.json")
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	
	return NavigationStack {
		CrewView(mission: missions[0], astronauts: astronauts)
	}
	.preferredColorScheme(.dark)
}
