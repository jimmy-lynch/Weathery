//
//  SettingsView.swift
//  Weathery
//
//  Created by Jimmy Lynch on 3/26/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var temperatureMeasurement: String
    
    let types = ["Celsius", "Fahrenheit", "Kelvin"]

    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Type", selection: $temperatureMeasurement) {
                    ForEach(types, id:\.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Measurement Unit")
        }
        
    }
}

//struct SettingsView_Previews: PreviewProvider {
//        static var previews: some View {
//        SettingsView()
//    }
//}
