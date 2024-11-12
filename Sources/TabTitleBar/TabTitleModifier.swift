//
//  TabTitleModifier.swift
//
//
//  Created by Brett Koster on 4/3/24.
//

import SwiftUI

struct TabTitleModifier: ViewModifier {
    @Binding var currentTabSelection: Int
    let index: Int
   
    @State private var foreground: Color = .secondary
    
    /// A view modifier that will stylize the tab item as either active or inactive
    /// - Parameters:
    ///   - currentTabSelection: a Binding<Int> that is the currently selected Tab
    ///   - index: an Int to compare to currentTabSelection to determine if this item is active or inactive
    init(currentTabSelection: Binding<Int>, index: Int) {
        _currentTabSelection = currentTabSelection
        self.index = index
       
        _foreground = State(wrappedValue: isActive() ? .primary : .secondary)
    }
   
    func body(content: Content) -> some View {
        content
            .scaleEffect(isActive() ? 1 : 0.7)
            .fontWeight(.bold)
            .foregroundStyle(foreground)
            
        // TODO: Change to iOS 17+ modifier when ...16 modifier is deprecated
            .onChange(of: currentTabSelection) { _ in
                update()
            }
    }
   
    // Convenience to determine if this tab is active or inactive
    // used in multiple places in this view
    func isActive() -> Bool {
        currentTabSelection == index
    }
   
    // Call this method to switch properties between active and inactive
    func update() {
        let active = isActive()
       
        withAnimation {
            foreground = active ? .primary : .secondary
        }
    }
}


