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
    public let id: UUID = UUID()
    public let view: Text
    public let index: Int
}
