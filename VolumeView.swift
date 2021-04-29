//
//  VolumeView.swift
//  MyCalculator
//
//  Created by Fahmida Chowdhury on 3/8/21.
//

import SwiftUI

struct VolumeView: View {
    
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 2
    let inputUnits = ["Kiloliters","Liters", "Quarts", "Gallons", "Tablespoon", "fluid ounces", "Cups", "Pints"]
    
    @State private var outputUnitValue = 2
    let outputUnits = ["Kiloliters","Liters", "Quarts", "Gallons", "Tablespoon", "fluid ounces", "Cups", "Pints"]
    
    var convert: String {
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitVolume.liters)
        
        switch inputUnits[inputUnitValue] {
        case "Kiloliters":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.kiloliters)
        case "Liters":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.liters)
        case "Quarts":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.quarts)
        case "Gallons":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.gallons)
        case "Tablespoon":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.tablespoons)
        case "Fluid Ounces":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.fluidOunces)
        case "Cups":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.cups)
        case "Pints":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.pints)
       
            
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.gallons)
        }
        
        switch inputUnits[outputUnitValue] {
        case "Kiloliters":
            output = String(describing:input.converted(to: UnitVolume.kiloliters))
        case "Liters":
            output = String(describing:input.converted(to: UnitVolume.liters))
        case "Quarts":
            output = String(describing:input.converted(to: UnitVolume.quarts))
        case "Gallons":
            output = String(describing:input.converted(to: UnitVolume.gallons))
        case "Tablespoon":
            output = String(describing:input.converted(to: UnitVolume.tablespoons))
        case "Fluid Ounces":
            output = String(describing:input.converted(to: UnitVolume.fluidOunces))
        case "Cups":
            output = String(describing:input.converted(to: UnitVolume.cups))
        case "Pints":
            output = String(describing:input.converted(to: UnitVolume.pints))
        default:
            output = String(describing:input.converted(to: UnitVolume.gallons))
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
        
                Section(header:Text("Pick Input Unit -  ")) {
                    Picker("Input Unit - ",selection: $inputUnitValue) {
                        ForEach(0..<inputUnits.count) {
                            Text("\(self.inputUnits[$0])")
                        }
                    }
                    
                }
                
                Section(header:Text("Pick Output Unit -")) {
                    Picker("Output Unit - ",selection: $outputUnitValue) {
                        ForEach(0..<outputUnits.count) {
                            Text("\(self.outputUnits[$0])")
                        }
                    }
                }
                
                Section(header:Text("Check Output Value here")) {
                    Text(convert)
                }
                
            }
            .navigationTitle(Text("Volume - Conversion"))
            
            
           
            
        }
    }
}

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}

