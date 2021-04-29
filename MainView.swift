//
//  ContentView.swift
//  Shared
//
//  Created by Fahmida Chowdhury on 3/9/21.
//


import SwiftUI

struct MainView : View {
      
    var body: some View {
        NavigationView {
                VStack(alignment: .center) {
                Text("Unit Conversion")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                    .lineLimit(nil)
                
            NavigationLink(destination: TemperatureView() ) {
                Text("Temperature")
                        .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: 250)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.gray]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                        .font(.title)
            }
                NavigationLink(destination: LengthView() ) {
                        Text("Length")
                                .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: 250)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.gray]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .font(.title)
            }
                NavigationLink(destination: MassView() ) {
                        Text("Mass")
                                .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: 250)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.gray]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .font(.title)
            }
                NavigationLink(destination: VolumeView() ) {
                        Text("Volume")
                                .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: 250)
                    .padding()
                    .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.gray]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .font(.title)
            }
                }
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
