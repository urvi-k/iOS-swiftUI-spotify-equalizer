

# iOS SwiftUI Spotify Equalizer

A customizable Spotify-style equalizer built entirely with SwiftUI, utilizing the default `Slider` component.

## ✨ Features

- Vertical sliders styled to resemble Spotify's equalizer
- Customizable frequency labels and slider values

## 📦 Installation

### Swift Package Manager (SPM)

To integrate the package using Swift Package Manager:

1. Open your Xcode project
2. Go to **File > Add Packages...**
3. Enter the repository URL: https://github.com/urvi-k/iOS-swiftUI-spotify-equalizer
4. Choose the latest version and click **Add Package**

## 🚀 Example Code:
Import the package and use the `EqualizerView` in your SwiftUI view:
```
import SwiftUI
import SpotifyEquilizerView

struct EQExampleView: View {
    @State var sliderValue: [CGFloat] = [0.4, 0.6, 0.7, 0.2, 0.7, 0.8]
    @State private var selectedType: MusicType?
    @State public var sliderLabel: [String] = ["60 Hz", "150 Hz", "400 Hz", "1kHz", "2.4 kHz", "15kHz"]

    enum MusicType: String, CaseIterable, Identifiable {
        case Dance
        case Deep
        case Electronic
        case Flat
        case HipHop = "Hip-Hop"
        case Jazz
        case Latin

        var id: String { self.rawValue }
    }

    var body: some View {
        VStack {
            Text("Equalizer")
                .foregroundColor(.white)
                .font(.title)

            ZStack(alignment: .top) {
                SpotifyEquilizerView.EqualizerView(sliderLabels: $sliderLabel, sliderValues: $sliderValue)
                    .padding(.vertical, 30)
            }
            .background(Color.gray.opacity(0.13))
            .cornerRadius(30)
            .padding()

            List {
                ForEach(MusicType.allCases) { type in
                    HStack {
                        Text(type.rawValue)
                            .padding(7)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(type == selectedType ? Color.gray.opacity(0.3) : Color.clear)
                            .frame(maxWidth: .infinity)
                    )
                    .background(.black)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedType = type
                        sliderValue = changeEQtype(type: type)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .listStyle(.plain)
        }
        .background(.black)
    }

    func changeEQtype(type: MusicType) -> [CGFloat] {
        switch type {
        case .Dance:
            return [0.6, 0.7, 0.5, 0.4, 0.6, 0.5]
        case .Deep:
            return [0.3, 0.4, 0.5, 0.6, 0.4, 0.3]
        case .Electronic:
            return [0.7, 0.8, 0.6, 0.5, 0.7, 0.6]
        case .Flat:
            return [0.5, 0.5, 0.5, 0.5, 0.5, 0.5]
        case .HipHop:
            return [0.8, 0.7, 0.6, 0.5, 0.6, 0.7]
        case .Jazz:
            return [0.4, 0.5, 0.6, 0.5, 0.4, 0.3]
        case .Latin:
            return [0.6, 0.5, 0.4, 0.5, 0.6, 0.7]
        }
    }
}

```



https://github.com/user-attachments/assets/17b543d8-132e-403c-9fe8-9203ed4a0f1f

![Simulator Screenshot - iPad Pro (12 9-inch) (6th generation) - 2025-04-22 at 11 34 47](https://github.com/user-attachments/assets/6e3be64b-5b8a-4dd6-a812-c757879ccbe2)


