//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Igor Florentino on 28/03/24.
//

import SwiftUI

extension ShapeStyle where Self == Color {
	static var darkBackground: Color {
		Color(red: 0.1, green: 0.1, blue: 0.2)
	}
	
	static var lightBackground: Color {
		Color(red: 0.2, green: 0.2, blue: 0.3)
	}
}

struct Color_Theme: View {
	var body: some View {
		VStack{
			AnyShape(.rect)
				.background(.darkBackground)
				.frame(width: 100, height: 100)
			AnyShape(.rect)
				.background(.lightBackground)
				.frame(width: 100, height: 100)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the available space
		.background(Color.init(white: 0.8)) // Set the background color to gray
		.edgesIgnoringSafeArea(.all)
	}
}

#Preview {
    Color_Theme()
}
