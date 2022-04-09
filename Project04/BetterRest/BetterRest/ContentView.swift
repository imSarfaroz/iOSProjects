//
//  ContentView.swift
//  BetterRest
//
//  Created by Sarfaroz on 4/9/22.
//

import CoreML
import SwiftUI


struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, .gray]), startPoint: .leading, endPoint: .trailing)
                                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("When do you want to wake up?")
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()

                    Group {
                    Text("Desired amount of sleep").padding()
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                        .padding([.trailing, .leading], 30)
                    
                    Text("How much coffee did you drink?")
                        .padding()
                    
                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                        .padding([.trailing, .leading], 30)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    Button("Calculate", action: calculateBedTime)
                        .frame(width: 280, height: 50)
                        .font(.system(size: 30, weight: .heavy, design: .rounded))
                        .buttonStyle(.bordered)
                        .cornerRadius(20)
                    
                    Text("*ML based calculations (Core ML)")
                        .font(.system(size: 26, weight: .light, design: .rounded))
                
                    Spacer()
                }
            }
            
            .navigationTitle("BetterRest").foregroundColor(.black).font(.system(size: 20, weight: .heavy, design: .rounded))
            
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
                    .foregroundColor(.white)
            }
        }
    }
    
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let munite = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + munite), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "You ideal bed time is ..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Was a problemt calculating a bed time."
        }
        
        showAlert = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
