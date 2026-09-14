//
//  ContentView.swift
//  MiniChallenge01
//
//  Created by SE students on 14/09/2026.
//

import SwiftUI


struct ContentView: View {
    // Khai báo biến thông tin cá nhân của bạn
    let name = "LyhoangKimNgoc"
    let studentID = "SESEIU220"
    let message = "Hello world! My iOS journey starts today!"
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Hello, Swift!")
                .font(.largeTitle)
                .bold()
            
            Text("My name is \(name)")
                .font(.title2)
            
            Text("Student ID: \(studentID)")
                .font(.title3)
            
            Text("\(message)")
                .font(.title3)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
