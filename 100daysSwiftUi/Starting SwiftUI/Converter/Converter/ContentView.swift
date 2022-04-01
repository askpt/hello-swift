//
//  ContentView.swift
//  Converter
//
//  Created by Andre Silva on 01/04/2022.
//
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemperature = 0.0
    @State private var inputTemperatureUnit = "Celsius"
    @State private var outputTemperatureUnit = "Kelvin"
    
    @FocusState private var inputIsFocused: Bool
    
    var result: Double {
        var baseUnit: Double
        var returnUnit: Double
        
        // Convert to base unit (C)
        if inputTemperatureUnit == "Fahrenheit" {
            baseUnit = (inputTemperature - 32) / 1.8
        } else if inputTemperatureUnit == "Kelvin" {
            baseUnit = inputTemperature - 273.15
        } else {
            baseUnit = inputTemperature
        }
        
        // Convert to final unit
        if outputTemperatureUnit == "Fahrenheit" {
            returnUnit = baseUnit * 1.8 + 32
        } else if outputTemperatureUnit == "Kelvin" {
            returnUnit = baseUnit + 273.15
        } else {
            returnUnit = baseUnit
        }
        
        return returnUnit
    }
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter a number", value: $inputTemperature, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    Picker("Select a unit", selection: $inputTemperatureUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Enter a number and choose a unit")
                }
                Section {
                    Picker("Select a unit", selection: $outputTemperatureUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Enter the destination unit")
                }
                Section {
                    Text(result.formatted(.number))
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
