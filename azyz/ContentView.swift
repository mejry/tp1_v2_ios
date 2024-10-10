import SwiftUI

struct ContentView: View {
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var result = ""

    var body: some View {
        VStack {
            Text("Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top,-140)

            TextField("Enter first number", text: $text1)
                .keyboardType(.decimalPad)
                .frame(width: 260)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 2)
                )

            TextField("Enter second number", text: $text2)
                .keyboardType(.decimalPad)
                .frame(width: 260)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 2)
                )
            Text("Result: \(result)")
                .padding()

            HStack {
                Button(action: { calculateResult(operation: .addition) }) {
                    Text("+")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: { calculateResult(operation: .subtraction) }) {
                    Text("-")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: { calculateResult(operation: .multiplication) }) {
                    Text("×")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: { calculateResult(operation: .division) }) {
                    Text("÷")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()

          
        }
        .padding()
    }

    enum Operation {
        case addition, subtraction, multiplication, division
    }

    private func calculateResult(operation: Operation) {
        guard let num1 = Double(text1), let num2 = Double(text2) else {
            result = "Invalid input"
            return
        }

        switch operation {
        case .addition:
            result = String(num1 + num2)
        case .subtraction:
            result = String(num1 - num2)
        case .multiplication:
            result = String(num1 * num2)
        case .division:
            if num2 != 0 {
                result = String(num1 / num2)
            } else {
                result = "Cannot divide by zero"
            }
        }
    }
}

#Preview {
    ContentView()
}
