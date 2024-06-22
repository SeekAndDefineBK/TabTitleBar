//
//  SingleTabTitleModifier.swift
//
//
//  Created by Brett Koster on 6/21/24.
//

import SwiftUI

/// Provides a ViewModifier for the larger menu style tab picker
/// As of writing, this is supposed to match the active state of TabTitleModifier with the exception of foregroundStyle and onChange
struct SingleTabTitleModifier: ViewModifier {
    let activeFontsize: CGFloat = 24

    func body(content: Content) -> some View {
        content
            .font(.system(size: activeFontsize))
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
    }
}
