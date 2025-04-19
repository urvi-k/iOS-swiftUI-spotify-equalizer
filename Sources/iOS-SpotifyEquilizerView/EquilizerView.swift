// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Combine

//class SliderData: ObservableObject {
//    @Published var sliderValues: [CGFloat]
//
//    init(count: Int, initialValue: CGFloat = 0.5) {
//        self.sliderValues = Array(repeating: initialValue, count: count)
//    }
//}

private struct EQView: View {
    @State public var sliderValues: [CGFloat] = [0.5,0.7,0.3,0.2,0.5,0.2]
    var body: some View {
        MainView(frequency: 6,
                 sliderValues: $sliderValues,
                 sliderFrameHeight: 200,
                 sliderTintColor: .blue,
                 gradientColors: [.blue, .clear])
        
    }
}

public struct MainView: View {
    
    public var frequency: Int
    public var sliderFrameHeight: CGFloat
    public var sliderTintColor: Color
    public var gradientColors: [Color]
    @Binding public var sliderValues: [CGFloat]
    
    public init(frequency: Int = 5,
                sliderValues: Binding<[CGFloat]>,
                sliderFrameHeight: CGFloat = 200,
                sliderTintColor: Color = .green,
                gradientColors: [Color] = [.green, .clear]) {
        self.frequency = frequency - 1
        self._sliderValues = sliderValues
        self.sliderFrameHeight = sliderFrameHeight
        self.sliderTintColor = sliderTintColor
        self.gradientColors = gradientColors
        
    }
    
    
    
    public var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(edges: .all)
            
            VStack {
                let sliderWidth: CGFloat = UIScreen.main.bounds.width/(CGFloat(frequency + 2))
                let spacing: CGFloat = 0
                
                ZStack(alignment: .top) {
                    
                    addEqPath(spacing: spacing, sliderWidth: sliderWidth)
                    
                    setSlider(sliderWidth: sliderWidth)
                }
                .frame(height: 200)
                .padding(.top,30)
            }
        }
        
    }
}

extension MainView {
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
                // .background(Color.gray.opacity(0.7))
                .frame(width: sliderWidth)
                
            }
        }
    }
    
}

