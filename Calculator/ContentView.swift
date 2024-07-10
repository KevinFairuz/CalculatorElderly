////
////  ContentView.swift
////  Calculator
////
////  Created by Kevin Fairuz on 08/07/24.
////
//
//import SwiftUI
//
//struct CalculatorSheet: View {
//    @State private var currentNumber: String = "0"
//    @State private var storedNumber: Double = 0
//    @State private var currentOperation: Operation? = nil
//    
//    enum Operation {
//        case add, subtract, multiply, divide
//    }
//
//    let buttonSize: CGFloat = 80 // Large button size
//    let fontSize: CGFloat = 40   // Large font size
//
//    var body: some View {
//        VStack(spacing: 10) { // Generous spacing
//            Text(currentNumber)
//                .font(.system(size: fontSize))
//                .frame(maxWidth: .infinity, alignment: .trailing)
//                .padding()
//
//            // Number buttons
//            ForEach(0..<10) { number in
//                Button(action: {
//                    if currentNumber == "0" {
//                        currentNumber = "\(number)"
//                    } else {
//                        currentNumber += "\(number)"
//                    }
//                }) {
//                    Text("\(number)")
//                        .font(.system(size: fontSize, weight: .bold))
//                        .frame(width: buttonSize, height: buttonSize)
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(buttonSize / 2) // Round buttons
//                }
//            }
//
//            // Operation buttons (+, -, *, /)
//            HStack(spacing: 10) {
//                ForEach([Operation.add, Operation.subtract, Operation.multiply, Operation.divide], id: \.self) { operation in
//                    Button(action: {
//                        handleOperation(operation)
//                    }) {
//                        Text(operationSymbol(operation))
//                            .font(.system(size: fontSize, weight: .bold))
//                            .frame(width: buttonSize, height: buttonSize)
//                            .background(Color.orange)
//                            .foregroundColor(.white)
//                            .cornerRadius(buttonSize / 2)
//                    }
//                }
//            }
//
//            // Other buttons (C, =, .)
//            HStack(spacing: 10) {
//                Button("C") {
//                    clear()
//                }
//                Button("=") {
//                    calculate()
//                }
//                Button(".") {
//                    addDecimal()
//                }
//            }
//            .buttonStyle(CalculatorButtonStyle(size: buttonSize, fontSize: fontSize))
//        } // End of VStack
//        .padding()
//    }
//
//    // ... (Helper functions: handleOperation, operationSymbol, clear, calculate, addDecimal)
//}
//
//// Custom button style for clearer visuals
//struct CalculatorButtonStyle: ButtonStyle {
//    let size: CGFloat
//    let fontSize: CGFloat
//
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .font(.system(size: fontSize, weight: .bold))
//            .frame(width: size, height: size)
//            .background(configuration.isPressed ? Color.gray : Color.white) // Visual feedback on press
//            .foregroundColor(.black)
//            .cornerRadius(size / 2)
//    }
//}
//
//
