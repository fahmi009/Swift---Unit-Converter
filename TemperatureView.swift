import SwiftUI

struct TemperatureView: View {
    
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 0
    let inputUnits = ["Fahrenheit", "Celsius"]
    
    @State private var outputUnitValue = 0
    let outputUnits = ["Fahrenheit", "Celsius"]

    
    var convert: String {
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitTemperature.fahrenheit)
        
        switch inputUnits[inputUnitValue] {
        case "Fahrenheit":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.fahrenheit)
        case "Celcius":
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.celsius)
       
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.fahrenheit)
        }
        
        switch inputUnits[outputUnitValue] {
        case "Fahrenheit":
            output = String(describing:input.converted(to: UnitTemperature.fahrenheit))
        case "Celsius":
            output = String(describing:input.converted(to: UnitTemperature.celsius))
        default:
            output = String(describing:input.converted(to: UnitTemperature.celsius))
        }
        
        return output
    }
    @State private var textInput = ""

        func converter(text: String) -> String {
            let textDouble = Double(textInput.replacingOccurrences(of: ",", with: ".")) ?? 0
            
            return String(format: "%.2f", textDouble)
        }
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header:Text("Enter Input: ")
                ) {
                    TextField("Input Value", text: $inputValue)
                        .keyboardType(.decimalPad)
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
            .navigationBarTitle(Text("Temperature")
                                    .foregroundColor(Color.orange))
            
        }
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}

