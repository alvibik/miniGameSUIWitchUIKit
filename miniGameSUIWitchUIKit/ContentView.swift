//
//  ContentView.swift
//  miniGameSUIWitchUIKit
//
//  Created by albik on 30.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = Double.random(in: 1...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                .padding(.bottom, 40)
            HStack {
                Text("0")
                GuesUISliderView(currentValue: $currentValue, alpha: computeScore())
                Text("100")
            }
            .padding()
            ButtonView(action: {showAlert.toggle()},
                       title: "Проверь меня!",
                       image: "checkmark")
            .padding(40)
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text(computeScore().formatted())}
            
            ButtonView(action: {targetValue = Int.random(in: 1...100)
                currentValue = Double.random(in: 0...100)},
                       title: "Начать заново",
                       image: "repeat")
        }
        
        
    }
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    let action: () -> ()
    let title: String
    let image: String
    
    var body: some View {
        Button(action: action) {
            Text(title)
            Image(systemName: image)
        }
        .foregroundColor(.white)
        .frame(width: 155, height: 35)
        .background(.blue)
        .cornerRadius(10)
        .shadow(color: .black, radius: 6)
    }
}
