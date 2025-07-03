//
//  YoutuberRanking.swift
//  ios
//
//  Created by Munkyu Yang on 7/3/25.
//

import SwiftUI

struct YoutuberRanking: View {
    var users: [User]

    var body: some View {
        VStack {
            ForEach(users, id: \.rank) { user in
                HStack {
                    Text("\(user.rank)")
                        .font(.title2.bold())

                    Spacer()

                    VStack(alignment: .center) {
                        Text(user.name)
                            .font(.subheadline.bold())

                        Text(user.subscribers)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }

                    Spacer()

                    Image(systemName: "trophy.fill")
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    YoutuberRanking(users: [])
}
