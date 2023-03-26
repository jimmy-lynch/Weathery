//
//  ContentView.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherDataViewModel()
    @State private var showingAddCity = false
    @State var temperatureMeasurement = "Celsius"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Backdrop")
                    .ignoresSafeArea()
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.weatherData) { weather in
                            CityWeatherView(viewModel: CityWeatherVM(model: weather, temperatureMeasurement: temperatureMeasurement))
                        }

                    }
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 5)
                }
                .navigationTitle("Weathery")
                .foregroundColor(Color.white)
                .toolbar {
                    NavigationLink {
                            SettingsView(temperatureMeasurement: $temperatureMeasurement)
                    } label: {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .bold()
                            .foregroundColor(Color.black)

                    }
                    Button {
                        showingAddCity = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .bold()
                            .foregroundColor(Color.black)

                    }
                }
                .sheet(isPresented: $showingAddCity) {
                    AddCityView(weather: viewModel)
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
