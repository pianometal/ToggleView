//
//  ToggleTestingView.swift
//
//  Created by Kyle Lovely
//
//  https://github.com/pianometal
//

import SwiftUI

/// Demonstrates use cases of ``ToggleView``
struct ToggleTestingView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var isDarkMode = false
    
    @State private var customHorizontal = false
    @State private var systemHorizontal = false
    
    @State private var customVertical = false
    @State private var systemVertical = false
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                Text("Dark Mode")
                
                ToggleView(
                    isOn: $isDarkMode,
                    height: 128,
                    color: .brown)
            }
            
            Divider()
                .padding()
            
            LabeledContent("Default setting") {
                ToggleView(isOn: $customHorizontal)
            }
            
            Toggle(isOn: $systemHorizontal) {
                Text("System")
            }
            .toggleStyle(.switch)
            
            Divider()
                .padding()
            
            HStack {
                
                VStack {
                    
                    Text("Custom")
                    
                    ToggleView(
                        isOn: $customVertical,
                        height: 64,
                        color: .red)
                }
                .frame(maxWidth: .infinity)
                
                VStack {
                    
                    Text("System")
                        .offset(x: 0, y: -16)
                    
                    Toggle(isOn: $systemVertical) { }
                        .labelsHidden()
                        .scaleEffect(2)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .font(.system(size: 14, weight: .bold, design: .rounded))
        .padding()
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .animation(.easeInOut(duration: 0.2), value: colorScheme)
        .frame(maxHeight: .infinity)
        .background((isDarkMode ? Color.black : .white).gradient)
    }
}

#Preview { ToggleTestingView() }
