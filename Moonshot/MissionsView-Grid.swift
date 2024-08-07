//
//  MissionsView.swift
//  Moonshot
//
//  Created by Igor Florentino on 03/04/24.
//

import SwiftUI

struct MissionsView_GridMode: View {
	
	let astronauts: [String:Astronaut]
	let missions: [Mission]
	
	let columns = [
		GridItem(.adaptive(minimum: 150))
	]
	
	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns) {
				ForEach(missions) { mission in
					VStack{
						NavigationLink(value: mission){
							VStack {
								Image(mission.image)
									.resizable()
									.scaledToFit()
									.frame(width: 100, height: 100)
									.padding()
								VStack {
									Text(mission.displayName)
										.font(.headline)
										.foregroundStyle(.white)
									Text(mission.formattedLaunchDate)
										.font(.caption)
										.foregroundStyle(.white.opacity(0.5))
								}
								.padding(.vertical)
								.frame(maxWidth: .infinity)
								.background(.lightBackground)
							}
							.clipShape(.rect(cornerRadius: 10))
							.overlay(
								RoundedRectangle(cornerRadius: 10)
									.stroke(.lightBackground)
							)
						}
					}
					.accessibilityElement(children: .ignore)
					.accessibilityLabel(mission.displayName)
					.accessibilityHint(mission.formattedLaunchDate)
				}
			}
			.padding([.horizontal, .bottom])
		}
		.background(.darkBackground)
		.navigationDestination(for: Mission.self) { mission in
			MissionView(mission: mission, astronauts: astronauts)
		}
	}
}

#Preview {
	let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	
	return NavigationStack {
		MissionsView_GridMode(astronauts: astronauts, missions: missions)
	}
}
