//
//  SliderUIKit.swift
//  GuessNumberSwiftUI+UIKIt
//
//  Created by Supodoco on 19.12.2022.
//

import Foundation
import SwiftUI

struct SliderUIKit: UIViewRepresentable {
    @Binding var thumbAlpha: Double
    @Binding var currentValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = .red.withAlphaComponent(thumbAlpha)
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
}

extension SliderUIKit {
    final class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            _value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            _value.wrappedValue = Double(sender.value)
        }
    }
}

struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(thumbAlpha: .constant(0.4), currentValue: .constant(50.0))
    }
}
