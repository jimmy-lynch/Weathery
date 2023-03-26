//
//  CityWeatherView.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct CityWeatherView: View {
    /// The View Model doing all the work for our view.
    let viewModel: CityWeatherVM
    
    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.cityName)
                .font(.largeTitle)
                .bold()
            Spacer()
            AsyncImage(
                url: URL(string: viewModel.icon),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 200)
                }, placeholder: {
                    Text("loading...")
                })
            Text(viewModel.description)
                .font(.headline)
            Spacer()
            Text(viewModel.currTemp)
                .font(.largeTitle)
                .bold()
            HStack {
                Text("min: \(viewModel.minTemp)")
                    .font(.caption)
                Text("max: \(viewModel.maxTemp)")
                    .font(.caption)

            }
            Spacer()
        }
        .padding()
        .padding(.horizontal, 40)
        .background(Color.blue.opacity(0.75), in: RoundedRectangle(cornerRadius: 25))
        .padding(.leading, 40)
        .padding(.trailing, 40)


    }
}

struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherView(viewModel: CityWeatherVM(model: Weather.example, temperatureMeasurement: "C"))
    }
}
