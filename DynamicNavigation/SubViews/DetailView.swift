//
//  DetailView.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/20/25.
//

import SwiftUI

struct DetailView: View {
    let id: Int
    
    var body: some View {
        Text("Detail View #\(id)")
            .font(.largeTitle)
            .navigationTitle("Detail #\(id)")
    }
}
