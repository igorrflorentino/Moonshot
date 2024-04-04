//
//  ContentView.swift
//  Moonshot
//
//  Created by Igor Florentino on 26/03/24.
//

import SwiftUI

struct ContentView: View {
	
	let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	@AppStorage("viewMode") private var viewMode = "Grid"
	
				
    var body: some View {
		NavigationStack {
			Group{
				if viewMode == "List"{
					MissionsView_ListMode(astronauts: astronauts, missions: missions)
				} else if viewMode == "Grid" {
					MissionsView_GridMode(astronauts: astronauts, missions: missions)
				}
			}
			.navigationTitle("Moonshot")
			.toolbar {
				ToolbarItem() {
					Button(action: {
						viewMode = viewMode == "Grid" ? "List" : "Grid"
					}) {
						if viewMode == "Grid" {
							Label("Show as table", systemImage: "list.dash")
						} else {
							Label("Show as grid", systemImage: "square.grid.2x2")
						}
					}
				}
			}
		}
		.preferredColorScheme(.dark)
	}
}

#Preview {
    ContentView()
}
