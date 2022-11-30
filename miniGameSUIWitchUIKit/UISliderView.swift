//
//  UISliderView.swift
//  miniGameSUIWitchUIKit
//
//  Created by albik on 30.11.2022.
//

import SwiftUI

struct GuesUISliderView: UIViewRepresentable {
    
    @Binding var currentValue: Double
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(context.coordinator, action: #selector(Coordinator.didValueSet), for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor(red: 0, green: 0, blue: 1, alpha: CGFloat(alpha)/100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension GuesUISliderView {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        @objc func didValueSet(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

struct GuesUISliderView_Preview: PreviewProvider {
    static var previews: some View {
        GuesUISliderView(currentValue: .constant(55), alpha: 100)
    }
}
