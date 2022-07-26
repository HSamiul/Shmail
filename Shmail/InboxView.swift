//
//  InboxView.swift
//  Shmail
//
//  Created by Samiul Hoque on 7/25/22.
//

import SwiftUI

struct InboxView: View {
    @State private var searchText = ""
    
    var body: some View {
        List {
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
        }
        .searchable(text: $searchText)
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
