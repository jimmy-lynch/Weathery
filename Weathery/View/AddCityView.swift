//
//  AddCityView.swift
//  Weathery
//
//  Created by Jimmy Lynch on 3/26/23.
//

import SwiftUI

struct AddCityView: View {
    @ObservedObject var weather: WeatherDataViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
            }
            .navigationTitle("Add a City")
            .toolbar {
                Button("Save") {
                    weather.getWeather(cityString: name)
                    dismiss()
                }
            }
        }
    }
}

struct AddCityView_Previews: PreviewProvider {
    static var previews: some View {
        AddCityView(weather: WeatherDataViewModel())
    }
}
