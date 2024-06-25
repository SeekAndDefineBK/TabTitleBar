import SwiftUI

public struct TabTitleBar: View {
    @Binding var currentTabSelection: Int
    let tabItems: [TabItem]
    let changeTabLabel: String
    let changeTabSymbol: String
    
    /// An HStack that animates between the currently selected item and the next selected item
    /// - Parameters:
    ///   - currentTabSelection: Binding<Int> that will determine which item is active / inactive
    ///   - tabItems: An Array of TabItems, an Object that
    ///   - changeTabLabel: a String value which will be populated next to the changeTabSymbol
    ///   - changeTabSymbol: a String value which should correpond to an SF Symbol
    public init(
        currentTabSelection: Binding<Int>,
        tabItems: [TabItem],
        changeTabLabel: String = "Change Tab",
        changeTabSymbol: String = "arrow.left.arrow.right.square"
    ) {
        _currentTabSelection = currentTabSelection
        self.tabItems = tabItems
        self.changeTabLabel = changeTabLabel
        self.changeTabSymbol = changeTabSymbol
    }
    
    // Shared View to use on multiple sizes
    @ViewBuilder
    /// Loops through all TabItems and creates a  styled button for each
    /// - Parameter withSelectionIndicator: Bool with a default value of false. Will show a checkmark when item is currently selected
    /// - Returns: Button Subviews created with each TabItem
    public func ButtonLoopView(withSelectionIndicator: Bool = false) -> some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation {
                    currentTabSelection = item.index
                }
            } label: {
                // For use in a Menu view (or another view else like it)
                if withSelectionIndicator {
                    Label {
                        ItemBuilder(item: item)
                            .modifier(TabTitleModifier(
                                currentTabSelection: $currentTabSelection,
                                index: item.index)
                            )
                    } icon: {
                        let isSelected = item.index == currentTabSelection
                        Image(systemName: isSelected ? "checkmark" : "")
                            .accessibilityHidden(true)
                            .accessibilityHint(isSelected ? "Active Tab" : "")
                    }
                } else {
                    // Default view for smaller views
                    ItemBuilder(item: item)
                        .modifier(TabTitleModifier(
                            currentTabSelection: $currentTabSelection,
                            index: item.index)
                        )
                }
            }
            // Set the color to primary so that the default blue button isn't used
            .foregroundStyle(.primary)
        }
    }
    
    @ViewBuilder
    public func ItemBuilder(item: TabItem) -> some View {
        Group {
            if let symbol = item.symbol {
                Label(
                    title: { item.view },
                    icon: { Image(systemName: symbol) }
                )
                
            } else {
                item.view
            }
        }
    }
            
    public var body: some View {
        ViewThatFits(in: .horizontal) {
            // By default the view does not scroll
            HStack {
                ButtonLoopView()
            }
            
            // When the too many tabs are present, the title will collapse into a menu
            Menu {
                ButtonLoopView(withSelectionIndicator: true)
            } label: {
                HStack {
                    ItemBuilder(item: tabItems[currentTabSelection])
                        .modifier(SingleTabTitleModifier())
                        .foregroundStyle(.foreground)
                    
                    Spacer()
                    
                    Label(changeTabLabel, systemImage: "arrow.left.arrow.right.square")
                }
            }
            .environment(\.menuOrder, .fixed)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityHint("Tap here to change the active view")
        }
    }
}

struct SmallExampleView: View {
    @State var tabSelection: Int = 0
    
    var tabItems: [TabItem] = Array(0...2).map({
        TabItem(
            view: Text("Item \($0)"),
            index: $0,
            symbol: "\($0).circle"
        )
    })
    
    var body: some View {
        VStack {
            TabTitleBar(
                currentTabSelection: $tabSelection,
                tabItems: tabItems
            )
        }
    }
}

struct LargeExampleView: View {
    @State var tabSelection: Int = 0
    
    var tabItems: [TabItem] = [
        TabItem(
            view: Text("Shoes"),
            index: 0
        ),
        TabItem(
            view: Text("Workouts"),
            index: 1
        ),
        TabItem(
            view: Text("Recents"),
            index: 2
        ),
        TabItem(
            view: Text("Equipment"),
            index: 3
        ),
        TabItem(
            view: Text("Routing"),
            index: 4
        ),
        TabItem(
            view: Text("Replacements"),
            index: 5
        ),
        TabItem(
            view: Text("Settings"),
            index: 6
        )
    ]
    
    var body: some View {
        TabTitleBar(
            currentTabSelection: $tabSelection,
            tabItems: tabItems
        )
    }
}

struct VeryLargeExampleView: View {
    @State var tabSelection: Int = 0
    
    var tabItems: [TabItem] = [
        TabItem(
            view: Text("Long Text Here"),
            index: 0,
            symbol: "circle.dashed"
        ),
        TabItem(
            view: Text("More Long Text Here"),
            index: 1,
            symbol: "circle.hexagonpath"
        ),
        TabItem(
            view: Text("This is supposed to break to a new line"),
            index: 2,
            symbol: "circle.hexagongrid"
        )
    ]
    
    var body: some View {
        TabTitleBar(
            currentTabSelection: $tabSelection,
            tabItems: tabItems,
            changeTabLabel: "Switch Tab",
            changeTabSymbol: "arrow.triangle.branch"
        )
    }
}

#Preview("Small") {
    SmallExampleView()
}

#Preview("Large") {
    LargeExampleView()
}

#Preview("VeryLarge") {
    VeryLargeExampleView()
}
