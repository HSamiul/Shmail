//
//  SettingsView.swift
//  Shmail
//
//  Created by Samiul Hoque on 7/25/22.
//

import SwiftUI

enum Appearance {
    case system, light, dark
}

class Settings: ObservableObject {
    @Published var accentColor = Color.teal
    @Published var appearance = Appearance.system
}

struct SettingsView: View {
    @ObservedObject private var settings: Settings
    @State private var accentColor: Color
    @State private var appearance: Appearance
    
    init(_ settings: Settings) {
        self.settings = settings
        self.accentColor = settings.accentColor
        self.appearance = settings.appearance
    }
    
    var body: some View {
        Form {
            Section("Appearance") {
                ColorPicker("Accent Color", selection: $accentColor, supportsOpacity: false)
            }
            
            Picker("Theme", selection: $appearance) {
                Text("System").tag(Appearance.system)
                Text("Light").tag(Appearance.light)
                Text("Dark").tag(Appearance.dark)
            }
            .pickerStyle(.menu)            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static let settings = Settings()
    
    static var previews: some View {
        SettingsView(settings)
            .environmentObject(settings)
    }
}
