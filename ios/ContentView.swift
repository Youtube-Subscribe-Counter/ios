//
//  ContentView.swift
//  ios
//
//  Created by Munkyu Yang on 7/3/25.
//

import SwiftUI

struct ContentView: View {
    let sampleUsers: [User] = [
        User(
            name: "플딱아재",
            subscribers: "1.2M",
            thumbnail: "https://yt3.ggpht.com/U0RvhBlfzttWL13ytIrGb6B8JwpA9OU8NT7IZHyNuQN9Z4SIZnLIv5-sJ-8TVJ-OZekViYJV=s88-c-k-c0xffffffff-no-rj-mo",
            rank: 1
        ),
        User(
            name: "샤인프릭_ShineFreak",
            subscribers: "980K",
            thumbnail: "https://yt3.ggpht.com/ytc/AIdro_n9Lhmtz1Z5Q6TsGlN3OVXvCEfYGCmV5ci0IGocIrg1YtY=s88-c-k-c0xffffffff-no-rj-mo",
            rank: 2
        ),
        User(
            name: "꿀탱탱",
            subscribers: "870K",
            thumbnail: "https://yt3.ggpht.com/A8pQpeaeMr0xGTmXQs2xb8PeSdoq8I3_0wkgBbK6vokFhCt2TBjWeihPKZpZwtbpbFZp6S-UEA=s88-c-k-c0xffffffff-no-rj-mo",
            rank: 3
        )
    ]

    let isSignedIn = false

    var body: some View {
        if !isSignedIn {
            LoginScreen()
        } else {
            VStack {
                Top3Users(users: sampleUsers)

                YoutuberRanking(users: sampleUsers)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
