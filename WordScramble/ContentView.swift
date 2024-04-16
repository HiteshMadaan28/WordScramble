//
//  ContentView.swift
//  WordScramble
//
//  Created by Hitesh Madaan on 16/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            Section("This is the main Section")
            {
                Text("Hello is this Hitesh")
            }
            Section("Dynamic Section")
            {
                ForEach(0..<100)
                {
                    Text("Hii \($0)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
