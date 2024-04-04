//
//  TabItem.swift
//  
//
//  Created by Brett Koster on 4/3/24.
//

import SwiftUI

/// An Object that contains the Text view and the index it is represented by
/// Conforms to Identifiable, you can define your own ID if necessary.
struct TabItem: Identifiable {
    let id: UUID = UUID()
    let view: Text
    let index: Int
}
