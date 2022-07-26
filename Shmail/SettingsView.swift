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
    
    init(_ settings: Settings) {
        self.settings = settings
    }
    
    var body: some View {
        Form {
            Section("Appearance") {
                ColorPicker("Accent Color", selection: $settings.accentColor, supportsOpacity: false)
                
                Picker("Theme", selection: $settings.appearance) {
                    Text("System").tag(Appearance.system)
                    Text("Light").tag(Appearance.light)
                    Text("Dark").tag(Appearance.dark)
                }
                .pickerStyle(.menu)
            }
            
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static let settings = Settings()
    
    static var previews: some View {
        SettingsView(settings)
            .environmentObject(settings)
    }
}
