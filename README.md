# ToggleView

A custom Toggle View constructed in SwiftUI

#### Requirements

- 📲 iOS 16
- 🔨 Xcode 15

#### Features

- Resizeable and scalable
- Support for `Dark Mode` 
- Labels displaying the state
- Customize the following
    - Size
    - Colors
    - Font design
    - Animation
    - **On** and **Off** labels

# Screenshots

<img width="480" alt="Toggle View Light Mode" src="https://github.com/pianometal/ToggleView/assets/41491421/52176d01-26ee-4cd2-b392-83415dab991b">

<img width="480" alt="Toggle View Dark Mode" src="https://github.com/pianometal/ToggleView/assets/41491421/7293c12f-ed2f-46bc-87dd-3ce5d0eac729">

# Video

https://github.com/pianometal/ToggleView/assets/41491421/078a422d-dfa0-4c60-93e3-dcdfcf116e20

# Code

Add this snippet to your project

```swift
//
//  ToggleView.swift
//
//  Created by Kyle Lovely
//
//  https://github.com/pianometal
//

import SwiftUI

/// Custom `.switch` style `Toggle` that scales appropriately based on ``height``
struct ToggleView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var isOn: Bool
    
    var height: CGFloat = 32
    var color: Color = .blue
    var fontDesign: Font.Design = .monospaced
    var animation = Animation.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.75)
    
    var on = "ON"
    var off = "OFF"
    
    var body: some View {
        
        HStack {
            
            if isOn { Spacer() }
            
            ZStack {
                
                Circle()
                    .fill(colorScheme == .light ? .white : .black)
                    .padding(padding)
                
                Text(isOn ? on : off)
                    .font(.system(size: fontSize, weight: .black, design: fontDesign))
                    .foregroundStyle(onColor.gradient)
            }
            
            if !isOn { Spacer() }
        }
        .frame(width: width, height: height)
        .background(onColor.gradient)
        .clipShape(Capsule())
        .onTapGesture { toggle() }
    }
    
    private func toggle() {
        withAnimation(animation) { isOn.toggle() }
    }
    
    private var width: CGFloat { height * 1.75 }
    private var padding: CGFloat { height / 16 }
    private var fontSize: CGFloat { height * 0.375 }
    private var onColor: Color { isOn ? color : .gray }
}

#Preview {
    ToggleView(isOn: .constant(true))
}
```
