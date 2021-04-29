//
//  MassView.swift
//  MyCalculator
//
//  Created by Fahmida Chowdhury on 3/8/21.
//

import SwiftUI

struct MassView: View {
    
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 2
    let inputUnits = ["kilogram", "grams", "ounces", "pound"]
    
    @State private var outputUnitValue = 2
    let outputUnits = ["kilogram", "grams", "ounces", "pound"]
    
    var convert: String {
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitMass.kilograms)
        
        switch inputUnits[inputUnitValue] {
        case "kilogram":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.kilograms)
        case "gram":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.grams)
        case "ounces":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.ounces)
        case "pound":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.pounds)
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.kilograms)
        }
        
        switch inputUnits[outputUnitValue] {
        case "kilogram":
            output = String(describing:input.converted(to: UnitMass.kilograms))
        case "gram":
            output = String(describing:input.converted(to: UnitMass.grams))
        case "ounces":
            output = String(describing:input.converted(to: UnitMass.ounces))
        case "pound":
            output = String(describing:input.converted(to: UnitMass.pounds))
        default:
            output = String(describing:input.converted(to: UnitMass.kilograms))
        }
        
        return output
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header:Text("Enter Input: ")
) {
                    TextField("Input Value", text: $inputValue)
                        .keyboardType(.decimalPad)

                }
        
                Section(header:Text("Pick Input Unit -  ")
                            ) {
                    Picker("Input Unit - ",selection: $inputUnitValue) {
                        ForEach(0..<inputUnits.count) {
                            Text("\(self.inputUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header:Text("Pick Output Unit -")) {
                    Picker("Output Unit - ",selection: $outputUnitValue) {
                        ForEach(0..<outputUnits.count) {
                            Text("\(self.outputUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header:Text("Check Output Value here")) {
                    Text(convert)
                }
                
            }
            .navigationTitle(Text("Mass - Converter"))
            
            
           
            
        }
    }
}

struct MassView_Previews: PreviewProvider {
    static var previews: some View {
        MassView()
    }
}


