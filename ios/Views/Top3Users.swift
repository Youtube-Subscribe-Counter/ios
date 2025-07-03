//
//  Top3Users.swift
//  ios
//
//  Created by Munkyu Yang on 7/3/25.
//

import SwiftUI

struct Top3Users: View {
    var users: [User]

    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let width = screenWidth * 0.2

        HStack(alignment: .bottom, spacing: 16) {
            Spacer()

            ForEach(users, id: \.rank) { user in
                // (rank, height)
                // (1, 160)
                // (2, 120)
                // (3, 80)
                let height = CGFloat(-40 * user.rank + 200)

                VStack(spacing: 16) {
                    AsyncImage(url: URL(string: user.thumbnail)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(.circle)
                            .overlay(Circle().stroke(.white, lineWidth: 2))
                            .shadow(radius: 4)
                    } placeholder: {
                        ProgressView()
                    }

                    Text(user.name)
                        .font(.caption)
                        .foregroundStyle(.black)

                    Text(user.subscribers)
                        .font(.footnote)
                        .foregroundStyle(.gray)

                    Text("\(user.rank)")
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                        .frame(width: width, height: height)
                        .background(Color(hex: "D2EBCD"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .frame(maxWidth: 80)

                Spacer()
            }
        }
    }
}

#Preview {
    Top3Users(users: [])
}
