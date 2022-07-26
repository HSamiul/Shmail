//
//  InboxView.swift
//  Shmail
//
//  Created by Samiul Hoque on 7/25/22.
//

import SwiftUI

class Email: Identifiable {
    private(set) var title: String
    private(set) var body: String
    private(set) var author: String
    
    init(title: String, body: String, author: String) {
        self.title = title
        self.body = body
        self.author = author
    }
}



class Inbox: ObservableObject {
    private(set) var emails: [Email] = mockEmails
    
    func search(for text: String) -> [Email] {
        return emails.filter { email in
            email.title.contains(text) || email.body.contains(text)
        }
    }
}

struct InboxView: View {
    @StateObject private var inbox = Inbox()
    @State private var searchText = ""
    
    var searchResults: [Email] {
        if searchText.isEmpty { return inbox.emails }
        return inbox.search(for: searchText)
    }
    
    var body: some View {
        VStack {
            if searchResults.isEmpty {
                Text("No emails containing \"\(searchText)\"")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

            } else {
                List(searchResults) { email in
                    VStack {
                        Text(email.title)
                            .font(.headline)
                        Text(email.author)
                            .font(.caption)
                        Text(email.body)
                            .font(.body)
                            .padding(5)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .navigationTitle("Inbox")
        .searchable(text: $searchText)
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
