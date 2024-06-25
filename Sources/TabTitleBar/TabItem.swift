//
//  TabItem.swift
//  
//
//  Created by Brett Koster on 4/3/24.
//

import SwiftUI

/// An Object that contains the Text view and the index it is represented by
/// Conforms to Identifiable, you can define your own ID if necessary.
public struct TabItem: Identifiable {
    public let id: UUID
    public let view: Text
    public let symbol: String?
    public let index: Int
    
    /// Initializer with all parameters
    /// - Parameters:
    ///   - id: UUID for Identifiable conformance. UUID() is the default, you can also define your own
    ///   - view: Text() view that will display on the title and in the picker
    ///   - index: Int the target index to determine if this TabItem is selected or not
    ///   - symbol: String? with a default value of nil. When defined, a Label with the view and symbol will be generated
    public init(
        id: UUID = UUID(),
        view: Text,
        index: Int,
        symbol: String? = nil
    ) {
        self.id = id
        self.view = view
        self.index = index
        self.symbol = symbol
    }
}
