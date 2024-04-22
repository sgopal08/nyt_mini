//
//  SettingsView.swift
//  NYT The Mini
//
//  Created by Sanjana G on 4/18/24.
//

import SwiftUI

struct PuzzleSettingsView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                SectionView(title: "WITHIN A WORD...")
                Divider()
                SwitchRow(title: "Skipped filled squares")
                Divider()
                Spacer().frame(height: 30)

                SectionView(title: "AT THE END OF A WORD...")
                Divider()
                SwitchRow(title: "Jump back to the first blank")
                Divider()
                SwitchRow(title: "Jump to the next clue")
                Divider()
                Spacer().frame(height: 30)

               
                SectionView(title: "OTHER")
                Divider()
                SwitchRow(title: "Color Theme")
                Divider()
                SwitchRow(title: "Clue Size")
                Divider()
                SwitchRow(title: "Play Music When Solved")
                Divider()
                SwitchRow(title: "Show Competitive Features")
                Divider()
                SwitchRow(title: "Show Milestones")
                Divider()
                SwitchRow(title: "Show overlays")
                Divider()
                SwitchRow(title: "Show Timer")
                Divider()
                Spacer().frame(height: 30)

            }
            .padding()
            .navigationBarTitle("Puzzle Settings", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Toggle(configuration)
            .tint(Color("lightBlue"))
    }
}


struct SectionView: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.caption)
            .foregroundColor(.black)
    }
}

struct SwitchRow: View {
    var title: String

    @State private var isOn = true

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.black)
                .font(.subheadline)
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .toggleStyle(CustomToggleStyle()) // Apply custom toggle style

        }
    }
}



#Preview {
    PuzzleSettingsView()
}
