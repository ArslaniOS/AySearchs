# AySearch
AYSearch is a customizable and reusable SwiftUI component that provides a streamlined way to implement a searchable list in your app. This component allows developers to easily display and filter lists of items based on user input, offering a seamless search experience.

#### Features
Modular Design: AYSearch is designed to be independent of specific data models, making it highly reusable across different contexts.
 Custom Content: Easily define the display of list items using a closure that accepts your custom view.
 Dynamic Filtering: The component integrates with a parent view to dynamically filter items based on the user's search query.
 Seamless Integration: Simply pass in your list of items and the search text binding, and AYSearchbar handles the rest.
 Elegant Styling: Comes with built-in styles, including rounded corners and shadows, with the option to customize further.

#### Usage
To use AYSearchbar in your SwiftUI project, follow these steps:

Declare Your Data Model:
Ensure that your data model conforms to Identifiable and Hashable.
```
struct Item: Identifiable, Hashable {
    let id = UUID()
    let name: String
}
```
Setup Your Parent View:
Implement the logic for displaying and filtering the items. The parent view manages the full list of items, the search text, and the filtered results.
struct ContentView: View {
    @State private var items = [
        Item(name: "Apple"),
        Item(name: "Banana"),
        Item(name: "Orange"),
        Item(name: "Grapes"),
        Item(name: "Pineapple"),
        Item(name: "Mango")
    ]
    @State private var searchText = ""
    @State private var filteredItems = [Item]()
    @State private var selectedItem: Item?

    var body: some View {
        VStack {
            // Example button to trigger showing the search bar
            Button(action: {
                applyFilter()
            }) {
                Text("Show Searchable List")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // Display AYSearchbar with filtered items
            AYSearch(filteredItems: $filteredItems, searchText: $searchText) { item in
                Text(item.name)
                    .onTapGesture {
                        selectedItem = item
                    }
            }
            
            Spacer()
            
            // Display selected item details
            if let selectedItem = selectedItem {
                Text("Selected Item: \(selectedItem.name)")
                    .padding()
            }
        }
        .padding()
        .onChange(of: searchText) { _ in
            applyFilter()
        }
    }
    
    // Generic method to filter items based on search text
    private func applyFilter() {
        if searchText.isEmpty {
            filteredItems = items
        } else {
            filteredItems = items.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}

Customize the List Display:
Define the appearance of each item in the list using the content closure. For example, you can customize the text style, add images, or include other UI elements.

###Customization
AYSearch can be customized to fit your app's design needs. You can modify the appearance of the search bar, list items, and more. Simply pass in your desired views and styles.
Swift 5.3+
iOS 14.0+
SwiftUI

## Installation
### [CocoaPods](http://cocoapods.org)
To integrate **AySearch** into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
use_frameworks!

pod 'AySearch'
```
Then, run the following command:

```bash
$ pod install
```

### [Swift Package Manager (SPM)](https://swift.org/package-manager)

#### Prerequisites
- OSX


#### Update `Package.swift`
To integrate `Search bar pop up` in your project, add the proper description to your `Package.swift` file:
```swift
// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/ArslaniOS/AySearchs.git")
    ],
    targets: [
        .target(
            name: "YOUR_TARGET_NAME",
            dependencies: ["AYSearch"]
        ),
        ...
    ]
)
```
Requirements![Simulator Screenshot - iPhone 15 Pro - 2024-07-30 at 16 01 29](https://github.com/user-attachments/assets/ea013b29-cf36-4ab6-8144-573b1f893ce0)
![Simulator Screenshot - iPhone 15 Pro - 2024-07-30 at 16 01 23](https://github.com/user-attachments/assets/da107c6b-4ae4-4d37-939a-39524e9e6f9d)
