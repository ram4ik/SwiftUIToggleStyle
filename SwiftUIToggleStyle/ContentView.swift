//
//  ContentView.swift
//  SwiftUIToggleStyle
//
//  Created by ramil on 23.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var toggleState = true

    var body: some View {

        VStack(spacing: 20) {

            Text("Toggle Style").font(.largeTitle)
            Text("Customization").font(.title).foregroundColor(.gray)
            Text("Creating a custom toggle style is different than customizing a button. You actually have to create and return something to use as a toggle.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .layoutPriority(2)
                .foregroundColor(.white)
        
            Toggle("", isOn: $toggleState)
                .toggleStyle(PurpleTextToggleStyle(label: "Purple Toggle"))

            Text("The best you can do customize everything but the actual Toggle.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
        }
    }
}

struct PurpleTextToggleStyle: ToggleStyle {

    var label = ""
    func makeBody(configuration: Self.Configuration) -> some View {
        // If you are using a Toggle, you cannot customize colors
        // as of SwiftUI 1.0.
        Toggle(isOn: configuration.$isOn) {
            Text(label)
                .foregroundColor(.purple)
                .fontWeight(.light)
                .font(.title)
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
