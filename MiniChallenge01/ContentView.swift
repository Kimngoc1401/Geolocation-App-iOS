//
//  ContentView.swift
//  MiniChallenge01
//
//  Created by SE students on 14/09/2026.
//

import SwiftUI

struct ContentView: View {
    
    let name = "Ly Hoang Kim Ngoc"
    let studentID = "SESEIU22034"
    let major = "Space Engineering"
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text("Hello, Swift! 👋")
                .font(.largeTitle)
                .bold()
            
            Text("My name is \(name)")
                .font(.title2)
            
            Text("Student ID: \(studentID)")
                .font(.title3)
            
            Text("Major: \(major)")
                .font(.body)
            
            Text("My iOS journey starts today! 🚀")
                .font(.title3)
        }
        .padding()
    }
}
