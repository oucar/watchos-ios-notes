//
//  ContentView.swift
//  NotesApp Watch App
//
//  Created by Onur Ucar on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    // Properties
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""

    // Function to get the document directory URL
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }

    // Function to save a note
    func saveNote() {
        do {
            // Convert the 'notes' array to data using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("ERROR: Saving data has failed!")
        }
    }

    // Function to load notes from disk
    func loadNotes() {
        // Adding a small delay to the loading process
        DispatchQueue.main.async {
            do {
                // Decoding the data
                let url = getDocumentDirectory().appendingPathComponent("notes")
                // Create a new property for the data
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("ERROR: Loading data has failed!")
            }
        }
    }

    // Function to delete a note
    func deleteNote(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            saveNote()
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add a new note", text: $text)
                    
                    Button {
                        // Only run the button's action when the text field is not empty
                        guard text.isEmpty == false else { return }
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        text = ""
                        saveNote()
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    // This is required to make the button smaller and not occupy
                    // the same amount of space as the text field
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                }
                Spacer()
                
                if notes.count >= 1 {
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                        .lineLimit(1)
                                        .padding(.leading, 5)
                                }
                            } //: HSTACK
                        } //: FOR EACH
                        .onDelete(perform: deleteNote)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                } //: LIST
            } //: VSTACK
            
        } //: NAVIGATION STACK
        .navigationTitle("Notes")
        .onAppear(perform: {
            loadNotes()
        })
    }
}

// Preview
#Preview {
    ContentView()
}
