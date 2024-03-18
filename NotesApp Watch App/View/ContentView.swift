//
//  ContentView.swift
//  NotesApp Watch App
//
//  Created by Onur Ucar on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    // Property
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""

    // Function

    // Body


    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6){
                    TextField("Add a new note", text: $text)
                    
                    Button {
                        //Action will go here
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    // this is required to make the button smaller and not occupy
                    // the same amount of space as the text field
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
                }
                Spacer()
            }
            .navigationTitle("Notes")
        }
    }

    // Preview
}

#Preview {
    ContentView()
}
