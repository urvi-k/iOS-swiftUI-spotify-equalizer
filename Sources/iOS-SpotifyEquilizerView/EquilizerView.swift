// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct EqualizerView: View {
    
    private var frequency: Int
    public var sliderFrameHeight: CGFloat
    public var sliderTintColor: Color
    public var gradientColors: [Color]
    @Binding public var sliderValues: [CGFloat]
    @State private var viewWidth: CGFloat = 300
    
    public init(sliderValues: Binding<[CGFloat]>,
                sliderFrameHeight: CGFloat = 200,
                sliderTintColor: Color = .green,
                gradientColors: [Color] = [.green, .clear]) {
        
        self._sliderValues = sliderValues
        self.frequency = sliderValues.count - 1
        self.sliderFrameHeight = sliderFrameHeight
        self.sliderTintColor = sliderTintColor
        self.gradientColors = gradientColors
        
    }
    
    
    public var body: some View {
        
        let sliderWidth: CGFloat = self.viewWidth/(CGFloat(frequency + 2))
        let spacing: CGFloat = 0
        
        ZStack(alignment: .top) {
            
            addEqPath(spacing: spacing, sliderWidth: sliderWidth)
            
            setSlider(sliderWidth: sliderWidth)
        }
        .frame(height: 200)
        .background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        self.viewWidth = geometry.size.width
                    }
            }
        )
    }
}

extension EqualizerView {
    func addEqPath(spacing: CGFloat, sliderWidth: CGFloat) -> some View {
        ZStack {
            EqualizerPathTopLine(
                sliderValues: sliderValues,
                sliderFrameH: sliderFrameHeight,
                sliderSpacing: spacing,
                sliderWidth: sliderWidth
            )
            .stroke(Color.green, lineWidth: 3)
            
            EqualizerPath(
                sliderValues: sliderValues,
                sliderFrameH: sliderFrameHeight,
                sliderSpacing: spacing,
                sliderWidth: sliderWidth
            )
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.green, .clear]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .animation(.easeInOut, value: sliderValues)
        }
    }
    
    func setSlider(sliderWidth: CGFloat) -> some View {
        HStack(spacing: 0) {
            ForEach(0...frequency, id: \.self) { i in
                SliderView(
                    sliderValue: $sliderValues[i],
                    sliderFrameHeight: sliderFrameHeight,
                    sliderTintColor: sliderTintColor
                )
                .frame(width: sliderWidth)
                
            }
        }
    }
    
}

