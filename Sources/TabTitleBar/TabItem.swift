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
    public let index: Int
    
    public init(id: UUID = UUID(), view: Text, index: Int) {
        self.id = id
        self.view = view
        self.index = index
    }
}
