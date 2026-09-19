//
//  ContentView.swift
//  HW1
//
//  Created by Kim Ngoc on 19/9/26.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    
    @State private var squareResult = ""
    @State private var cubeResult = ""
    @State private var factorialResult = ""
    @State private var primeResult = ""

    @State private var firstNumber = ""
    @State private var secondNumber = ""
    
    @State private var gcdResult = ""
    @State private var lcmResult = ""

    @State private var errorMessage = ""
    
    var body: some View {
        ZStack {
            
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    
                    VStack(spacing: 8) {
                        
                        Image(systemName: "function")
                            .font(.system(size: 42))
                            .foregroundStyle(.blue)
                        
                        Text("Number Tools")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Calculate, explore and learn!")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.top, 25)
                    
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundStyle(.red)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.red.opacity(0.1))
                            )
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Single Number")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        TextField("Enter a number", text: $inputNumber)
                            .keyboardType(.numbersAndPunctuation)
                            .textFieldStyle(.roundedBorder)
                        
                        HStack(spacing: 12) {
                            
                            Button {
                                calculateSquare()
                            } label: {
                                Label("n²", systemImage: "square")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.borderedProminent)
                            
                            
                            Button {
                                calculateCube()
                            } label: {
                                Label("n³", systemImage: "cube")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)
                        }
                        
                        
                        HStack(spacing: 12) {
                            
                            Button {
                                calculateFactorial()
                            } label: {
                                Label("n!", systemImage: "exclamationmark")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)
                            
                            
                            Button {
                                checkPrime()
                            } label: {
                                Label("Prime?", systemImage: "checkmark.seal")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color(.secondarySystemGroupedBackground))
                    )
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Results")
                            .font(.headline)
                        
                        resultRow(title: "n²", value: squareResult)
                        
                        Divider()
                        
                        resultRow(title: "n³", value: cubeResult)
                        
                        Divider()
                        
                        resultRow(title: "n!", value: factorialResult)
                        
                        Divider()
                        
                        resultRow(title: "Prime?", value: primeResult)
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color(.secondarySystemGroupedBackground))
                    )
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Two Numbers")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        HStack(spacing: 12) {
                            
                            TextField("Number 1", text: $firstNumber)
                                .keyboardType(.numbersAndPunctuation)
                                .textFieldStyle(.roundedBorder)
                            
                            TextField("Number 2", text: $secondNumber)
                                .keyboardType(.numbersAndPunctuation)
                                .textFieldStyle(.roundedBorder)
                        }
                        
                        
                        HStack(spacing: 12) {
                            
                            Button {
                                calculateGCD()
                            } label: {
                                Label("UCLN / GCD", systemImage: "equal")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.borderedProminent)
                            
                            
                            Button {
                                calculateLCM()
                            } label: {
                                Label("BCNN / LCM", systemImage: "arrow.triangle.2.circlepath")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color(.secondarySystemGroupedBackground))
                    )
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Two Number Results")
                            .font(.headline)
                        
                        resultRow(title: "UCLN / GCD", value: gcdResult)
                        
                        Divider()
                        
                        resultRow(title: "BCNN / LCM", value: lcmResult)
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color(.secondarySystemGroupedBackground))
                    )
                    
                    Button {
                        clearAll()
                    } label: {
                        Label("Clear All", systemImage: "arrow.counterclockwise")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        }
    }
    
    func resultRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text(value.isEmpty ? "—" : value)
                .foregroundStyle(.secondary)
        }
    }
    
    func calculateSquare() {
        
        errorMessage = ""
        
        if let number = Double(inputNumber) {
            squareResult = String(number * number)
        } else {
            errorMessage = "Please enter a valid number."
        }
    }
    
    func calculateCube() {
        
        errorMessage = ""
        
        if let number = Double(inputNumber) {
            cubeResult = String(number * number * number)
        } else {
            errorMessage = "Please enter a valid number."
        }
    }
    
    func calculateFactorial() {
        
        errorMessage = ""
        
        if let number = Int(inputNumber) {
            
            if number < 0 {
                errorMessage = "Factorial is not available for negative numbers."
                factorialResult = ""
            } else {
                
                var result = 1
                
                if number > 1 {
                    for i in 2...number {
                        result *= i
                    }
                }
                
                factorialResult = String(result)
            }
            
        } else {
            errorMessage = "Please enter a whole number for factorial."
        }
    }
    
    func checkPrime() {
        
        errorMessage = ""
        
        if let number = Int(inputNumber) {
            
            if number < 2 {
                primeResult = "No"
            } else {
                
                var isPrime = true
                
                if number > 2 {
                    for i in 2..<number {
                        if number % i == 0 {
                            isPrime = false
                            break
                        }
                    }
                }
                
                if isPrime {
                    primeResult = "Yes"
                } else {
                    primeResult = "No"
                }
            }
            
        } else {
            errorMessage = "Please enter a whole number."
        }
    }

    func calculateGCD() {
        
        errorMessage = ""
        
        if let first = Int(firstNumber),
           let second = Int(secondNumber) {
            
            var a = abs(first)
            var b = abs(second)
            
            while b != 0 {
                let remainder = a % b
                a = b
                b = remainder
            }
            
            gcdResult = String(a)
            
        } else {
            errorMessage = "Please enter two valid whole numbers."
        }
    }
    
    func calculateLCM() {
        
        errorMessage = ""
        
        if let first = Int(firstNumber),
           let second = Int(secondNumber) {
            
            if first == 0 || second == 0 {
                lcmResult = "0"
            } else {
                
                var a = abs(first)
                var b = abs(second)
                
                while b != 0 {
                    let remainder = a % b
                    a = b
                    b = remainder
                }
                
                let gcd = a
                let lcm = abs(first * second) / gcd
                
                lcmResult = String(lcm)
            }
            
        } else {
            errorMessage = "Please enter two valid whole numbers."
        }
    }
    
    func clearAll() {
        
        inputNumber = ""
        firstNumber = ""
        secondNumber = ""
        
        squareResult = ""
        cubeResult = ""
        factorialResult = ""
        primeResult = ""
        
        gcdResult = ""
        lcmResult = ""
        
        errorMessage = ""
    }
}


#Preview {
    ContentView()
}
