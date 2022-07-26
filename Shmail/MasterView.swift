//
//  MasterView.swift
//  Shmail
//
//  Created by Samiul Hoque on 7/25/22.
//

import SwiftUI

struct MasterView: View {
    @StateObject private var settings = Settings()
    
    var body: some View {
        NavigationStack {
            InboxView()
                .toolbar {
                    HStack(spacing: 0) {
                        NavigationLink { ProfileView() } label: {
                            ButtonLabel("person.crop.circle")
                        }
                        NavigationLink { SettingsView(settings) } label: {
                            ButtonLabel("gearshape")
                        }
                    }
                }
        }
        .environmentObject(settings)
    }
}

struct ButtonLabel: View {
    private var imageName: String
    
    init(_ imageName: String) {
        self.imageName = imageName
    }
    
    var body: some View {
        Image(systemName: imageName)
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
