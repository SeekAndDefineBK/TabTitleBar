//
//  TabTitleModifier.swift
//
//
//  Created by Brett Koster on 4/3/24.
//

import SwiftUI

struct TabTitleModifier: ViewModifier {
    @Binding var currentTabSelection: Int
    let targetIndex: Int
   
    // Font size is used to reduce variables being changed... there is an issue where the baseline is shifting.
    // TODO: Once this issue is resolved, re-evaluate if you can use Apple's font size options
    @State private var fontSize: CGFloat = 12
    @State private var foreground: Color = .secondary
   
    // MARK: Font Size Options
    let inactiveFontsize: CGFloat = 12
    let activeFontsize: CGFloat = 24
    
    /// A view modifier that will stylize the tab item as either active or inactive
    /// - Parameters:
    ///   - currentTabSelection: a Binding<Int> that is the currently selected Tab
    ///   - targetIndex: an Int to compare to currentTabSelection to determine if this item is active or inactive
    init(currentTabSelection: Binding<Int>, targetIndex: Int) {
        _currentTabSelection = currentTabSelection
        self.targetIndex = targetIndex
       
        _fontSize = State(wrappedValue: isActive() ? activeFontsize : inactiveFontsize)
        _foreground = State(wrappedValue: isActive() ? .primary : .secondary)
    }
   
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize))
            .fontWeight(.bold)
            .foregroundStyle(foreground)
            .onChange(of: currentTabSelection) { _ in // TODO: Change to iOS 17+ modifier when ...16 modifier is deprecated
                update()
            }
    }
   
    // Convenience to determine if this tab is active or inactive
    func isActive() -> Bool {
        currentTabSelection == targetIndex
    }
   
    // Call this method to switch properties between active and inactive
    func update() {
        let active = isActive()
       
        withAnimation {
            fontSize = active ? activeFontsize : inactiveFontsize
            foreground = active ? .primary : .secondary
        }
    }
}
