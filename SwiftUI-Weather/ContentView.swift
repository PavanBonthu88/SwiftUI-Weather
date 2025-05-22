//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Pavan Kumar Bonthu on 19/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackGroundView(isNight: $isNight)
            VStack(spacing: 10) {
                CityTextView(cityName: "Hyderabad, Telangana")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfTheWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfTheWeek: "WED",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 28)
                    WeatherDayView(dayOfTheWeek: "THU",
                                   imageName: "wind",
                                   temperature: 24)
                    WeatherDayView(dayOfTheWeek: "FRI",
                                   imageName: "smoke.fill",
                                   temperature: 16)
                    WeatherDayView(dayOfTheWeek: "SAT",
                                   imageName: "snowflake.circle.fill",
                                   temperature: 01)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonView(title: "Change Day Time",
                                      textColor: .blue,
                                      backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfTheWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfTheWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackGroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("Light Blue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}



struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .bold))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


