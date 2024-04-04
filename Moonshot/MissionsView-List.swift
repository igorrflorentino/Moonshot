//
//  MissionsView-List.swift
//  Moonshot
//
//  Created by Igor Florentino on 03/04/24.
//

import SwiftUI

struct MissionsView_ListMode: View {
	
	let astronauts: [String:Astronaut]
	let missions: [Mission]
	
	var body: some View {
		NavigationStack {
			List{
				ForEach(missions, id: \.id) { mission in
					NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
						HStack {
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
							.frame(maxWidth: .infinity, maxHeight: 135)
							.background(.lightBackground)
						}
						.clipShape(RoundedRectangle(cornerRadius: 10))
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(.lightBackground, lineWidth: 1)
						)
					}
					.listRowSeparator(.hidden)
				}
				.listRowBackground(Color.darkBackground)
			}
			.listStyle(PlainListStyle())
			.padding(.horizontal)
			.background(Color.darkBackground)
		}
		.preferredColorScheme(.dark)
	}
}

#Preview {
	let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	return MissionsView_ListMode(astronauts: astronauts, missions: missions)
}
