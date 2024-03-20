//
//  CreditsView.swift
//  NotesApp Watch App
//
//  Created by Onur Ucar on 3/20/24.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
    VStack(spacing: 3) {
      // Profile image
      Image("developer-no1")
        .resizable()
        .scaledToFit()
        .layoutPriority(1)
      
      HeaderView(title: "Credits")
      
      Text("Onur Ucar")
        .foregroundColor(.primary)
        .fontWeight(.bold)
      
      Text("Software Engineer")
        .font(.footnote)
        .foregroundColor(.secondary)
        .fontWeight(.light)
    } //: VSTACK
  }
}

// MARK: - PREVIEW

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
  }
}
