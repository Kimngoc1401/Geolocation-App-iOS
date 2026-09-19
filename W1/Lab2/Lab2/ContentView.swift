//
//  ContentView.swift
//  Lab2
//
//  Created by Kim Ngoc on 19/9/26.
//

import SwiftUI

struct ContentView: View {
    @State private var inputN = ""
    @State private var resultSquare = ""
    @State private var resultCube = ""
    @State private var resultDouble = ""

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    
                    VStack(spacing: 8) {
                        Image(systemName: "function")
                            .font(.system(size: 40))
                            .foregroundStyle(.blue)

                        Text("Kim Ngoc Calculator")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Simple Swift Calculator")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Enter a number")
                            .font(.headline)

                        TextField("e.g. 5", text: $inputN)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.roundedBorder)
                    }

                    VStack(spacing: 12) {

                        Button {
                            if let number = Double(inputN) {
                                resultSquare = String(number * number)
                            }
                        } label: {
                            Label("Calculate n²", systemImage: "square")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)

                        Button {
                            if let number = Double(inputN) {
                                resultCube = String(number * number * number)
                            }
                        } label: {
                            Label("Calculate n³", systemImage: "cube")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)

                        Button {
                            if let number = Double(inputN) {
                                resultDouble = String(number * 2)
                            }
                        } label: {
                            Label("Double n", systemImage: "multiply")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }

                    VStack(alignment: .leading, spacing: 16) {
                        Text("Results")
                            .font(.headline)

                        HStack {
                            Text("n²")
                                .fontWeight(.semibold)

                            Spacer()

                            Text(resultSquare.isEmpty ? "—" : resultSquare)
                                .foregroundStyle(.secondary)
                        }

                        Divider()

                        HStack {
                            Text("n³")
                                .fontWeight(.semibold)

                            Spacer()

                            Text(resultCube.isEmpty ? "—" : resultCube)
                                .foregroundStyle(.secondary)
                        }

                        Divider()

                        HStack {
                            Text("2n")
                                .fontWeight(.semibold)

                            Spacer()

                            Text(resultDouble.isEmpty ? "—" : resultDouble)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.secondarySystemGroupedBackground))
                    )

                    Spacer()
                }
                .padding(.horizontal, 24)
            }
        }
    }
}
