//
//  Note.swift
//  NotesApp Watch App
//
//  Created by Onur Ucar on 3/18/24.
//

import Foundation

struct Note: Identifiable, Codable {
    let id : UUID
    let text: String
}

