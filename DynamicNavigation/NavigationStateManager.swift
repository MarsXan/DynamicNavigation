//
//  NavigationStateManager.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/20/25.
//

//
//  NavigationStateManager.swift
//  DynamicNavigation
//
//  Created by Mohsen on 4/20/25.
//

import SwiftUI

@Observable
class NavigationStateManager {
    // Navigation paths for each tab
    var tab1Path: [Route] = []
    var tab2Path: [Route] = []
    var tab3Path: [Route] = []
    var tab4Path: [Route] = []
    var tab5Path: [Route] = []
    
    var selectedTab: Int = 0
    
    // Presentation states
    var isSheetPresented: Bool = false
    var isFullScreenSheetPresented: Bool = false
    var isModalPresented: Bool = false
    
    // Current presentation content
    var currentSheetDestination: SheetDestination?
    var currentFullScreenSheetDestination: SheetDestination?
    var currentModalDestination: ModalDestination?
    
    // MARK: - Tab Navigation Methods
    
    func navigateToSettings() {
        selectedTab = 4
        tab5Path = [.settings]
    }
    
    // MARK: - Sheet Presentation Methods
    
    func presentSheet(_ destination: SheetDestination) {
        currentSheetDestination = destination
        isSheetPresented = true
    }
    
    func dismissSheet() {
        isSheetPresented = false
        // Optional: Clear the destination after a delay to allow for animations
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.currentSheetDestination = nil
        }
    }
    
    // MARK: - Full Screen Sheet Methods
    
    func presentFullScreenSheet(_ destination: SheetDestination) {
        currentFullScreenSheetDestination = destination
        isFullScreenSheetPresented = true
    }
    
    func dismissFullScreenSheet() {
        isFullScreenSheetPresented = false
        // Optional: Clear the destination after a delay to allow for animations
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.currentFullScreenSheetDestination = nil
        }
    }
    
    // MARK: - Modal Presentation Methods
    
    func presentModal(_ destination: ModalDestination) {
        currentModalDestination = destination
        isModalPresented = true
    }
    
    func dismissModal() {
        isModalPresented = false
        // Optional: Clear the destination after a delay to allow for animations
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.currentModalDestination = nil
        }
    }
    
    // MARK: - Deep Link Handling
    
    func handleDeepLink(_ url: URL) {
        // Example: myapp://tab/0/level/3
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let host = components.host else {
            return
        }
        
        if host == "tab" {
            let pathComponents = components.path.split(separator: "/").map { String($0) }
            
            if pathComponents.count >= 2, let tabIndex = Int(pathComponents[0]) {
                // Set the selected tab
                selectedTab = min(max(tabIndex, 0), 4)
                
                // Handle the rest of the path for navigation
                if pathComponents.count >= 4 && pathComponents[1] == "level",
                   let levelNum = Int(pathComponents[2]) {
                    // Navigate to a specific level in tab 1
                    if tabIndex == 0 {
                        switch levelNum {
                        case 1: tab1Path = [.level1]
                        case 2: tab1Path = [.level1, .level2]
                        case 3: tab1Path = [.level1, .level2, .level3]
                        case 4: tab1Path = [.level1, .level2, .level3, .level4]
                        case 5: tab1Path = [.level1, .level2, .level3, .level4, .level5]
                        default: break
                        }
                    }
                }
            }
        }
    }
}
