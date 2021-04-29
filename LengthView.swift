//
//  LengthView.swift
//  Unit Converter
//
//  Created by Fahmida Chowdhury on 3/9/21.
//

import SwiftUI

struct LengthView: View {
    
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 2
    let inputUnits = ["meters", "kilometers", "feet", "miles"]
    
    @State private var outputUnitValue = 2
    let outputUnits = ["meters", "kilometers", "feet", "miles"]
    
    var convert: String {
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitLength.meters)
        
        switch inputUnits[inputUnitValue] {
        case "meters":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        case "kilometers":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.kilometers)
        case "feet":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.feet)
        case "miles":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.miles)
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        }
        
        switch inputUnits[outputUnitValue] {
        case "meters":
            output = String(describing:input.converted(to: UnitLength.meters))
        case "kilometers":
            output = String(describing:input.converted(to: UnitLength.kilometers))
        case "feet":
            output = String(describing:input.converted(to: UnitLength.feet))
        case "miles":
            output = String(describing:input.converted(to: UnitLength.miles))
        default:
            output = String(describing:input.converted(to: UnitLength.meters))
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
            .navigationBarTitle(Text("Length - Conversion"))
            .animation(.linear(duration: 0.06))
            
            
           
            
        }
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}


