//
//  ContentView.swift
//  FInal Grade Calculator 2
//
//  Created by alex acevedo on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var hourlyWageTextField=""
    @State private var hoursWorkedTextField=""
    @State private var pay = 0.0
    var body: some View {
        VStack {
            CustomText(text: "Weekly Payroll")
            CustomTextField(placeholder:  "Hourly Wage", variable: $hourlyWageTextField)
            CustomTextField(placeholder:  "Hours Worked", variable: $hoursWorkedTextField)
            Button("Calculate") {
            if let hourlyWage = Double(hourlyWageTextField) {
                if let hoursWorked = Double(hoursWorkedTextField) {
                    pay = calculateGrossPay(hourlyWage: hourlyWage, hoursWorked: hoursWorked)
                }
            }
        }
        .padding()
        CustomText(text: "Gross Pay")
        CustomText(text: "$" + String(format: "%.2f", pay))
        Spacer()
    }
}

    func calculateGrossPay(hourlyWage: Double, hoursWorked: Double) -> Double {
        let regularHours = min(hoursWorked, 40.0)
                let overtimeHours = max(hoursWorked - 40.0, 0.0)
                let regularPay = regularHours * hourlyWage
                let overtimePay = overtimeHours * hourlyWage * 1.5
                return regularPay + overtimePay
                
       // let regularPay = hoursWorked * hourlyWage / 2
        //let overtimePay =
       // return regularPay + overtimePay
    }
}
    #Preview {
        
    ContentView()
}

struct CustomTextField:View {
    let placeholder : String
    let variable :Binding<String>
    var body: some View {
        TextField(placeholder, text: variable)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 30)
            .font(.body)
            .padding()
    }
}

struct CustomText: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
    }
}
