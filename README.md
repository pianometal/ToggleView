# ToggleView

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

<img height="480" alt="Toggle View Light Mode" src="https://github.com/pianometal/ToggleView/assets/41491421/8cf6c24d-57b0-4187-8f7d-cbc855dd0d70">

<img height="480" alt="Toggle View Dark Mode" src="https://github.com/pianometal/ToggleView/assets/41491421/421eaf5f-a311-4d11-b3b9-d668b1b1d656">

# Video

https://github.com/pianometal/ToggleView/assets/41491421/8f85ad74-761a-49f1-9ef3-16e4061584f6

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
