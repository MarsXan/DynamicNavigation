//
//  TabFourView.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/20/25.
//

import SwiftUI

struct TabFourView: View {
    @Environment(NavigationStateManager.self) var navigationManager: NavigationStateManager
    
    var body: some View {
        @Bindable var navigationManagerBindable = navigationManager
        NavigationStack(path: $navigationManagerBindable.tab4Path) {
            VStack {
                Text("Tab 4 Messages View")
                    .font(.largeTitle)
                
                Button("Open Message #15") {
                    navigationManager.tab4Path.append(.detail(id: 15))
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Messages")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .detail(let id):
                    DetailView(id: id)
                case .settings:
                    SettingsView()
                case .profile:
                    ProfileView()
                case .favorites:
                    FavoritesView()
                case .subCategory(let name):
                    SubCategoryView(name: name)
                default:
                    Text("Unsupported route for this tab")
                }
            }
        }
    }
}
