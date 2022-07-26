//
//  MasterView.swift
//  Shmail
//
//  Created by Samiul Hoque on 7/25/22.
//

import SwiftUI

struct MasterView: View {
    var body: some View {
        NavigationView {
            InboxView()
        }
        .toolbar {
            
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
