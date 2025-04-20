//
//  SubCategoryView.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/20/25.
//

import SwiftUI

struct SubCategoryView: View {
    let name: String
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        VStack {
            Text("Sub-Category: \(name)")
                .font(.largeTitle)
            
            Button("View Item #101") {
                if navigationManager.selectedTab == 1 {
                    navigationManager.tab2Path.append(.detail(id: 101))
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle(name)
    }
}
