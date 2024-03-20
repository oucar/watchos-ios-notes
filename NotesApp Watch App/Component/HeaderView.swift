//
//  HeaderView.swift
//  NotesApp Watch App
//
//  Created by Onur Ucar on 3/20/24.
//

import SwiftUI

struct HeaderView: View {
  
  var title: String = ""

  var body: some View {
    VStack {
      if title != "" {
        Text(title.uppercased())
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(.accentColor)
      }
      
        HStack {
        Capsule()
          .frame(height: 1)
        
        Image(systemName: "note.text")
        
        Capsule()
          .frame(height: 1)
      } //: HSTACK
      .foregroundColor(.accentColor)
    } //: VSTACK
  }
}

// MARK: - PREVIEW

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HeaderView(title: "Credits")
      
      HeaderView()
    }
  }
}
