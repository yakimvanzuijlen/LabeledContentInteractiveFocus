# LabeledContentInteractiveFocus

A SwiftUI `LabeledContentStyle` that moves focus to the content of `LabeledContent` when its label has been tapped.

This package was inspired by the way `<label>` in HTML works. When a `<label>` is associated with a form control, clicking on the label will move focus to the associated form control. This same behavior can also be seen in the Settings app on iOS for labeled text fields in forms. SwiftUI provides `LabeledContent` to associate a label with content, but it doesn't have the same focus functionality when you tap the label. This package solves that.

## Installation
### Swift Package Manager
LabeledContentInteractiveFocus can be installed using Swift Package Manager

1. Go to `File` > `Add Package Dependencies`
2. Enter the repository URL: `https://github.com/yakimvanzuijlen/LabeledContentInteractiveFocus.git`
3. Click `Add Package`

Or add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "[https://github.com/yakimvanzuijlen/LabeledContentInteractiveFocus.git]", from: "1.0.0")
]
```

## Usage
First, import the library.

```swift
import LabeledContentInteractiveFocus
```

You can either apply the interaction using the `labeledContentInteractiveFocus()` view modifier or as a `LabeledContentStyle`. They have the same effect.

### Use as a view modifier
```swift
struct ContentView: View {
    @State private var name = ""
    @State private var password = ""
    var body: some View {
        Form {
            LabeledContent("Name") {
                TextField("", text: $name)
                    .textContentType(.name)
            }
            LabeledContent("Password") {
                SecureField("", text: $password)
                    .textContentType(.newPassword)
            }
        }
        .labeledContentInteractiveFocus()
    }
}
```

On macOS you can also use it with standard text field labels. There is no need to wrap the text field in a `LabeledContent` since on macOS the text field label is already visible.

```swift
struct Example: View {
    @State private var animal = ""
    var body: some View {
        Form {
            #if os(macOS)
            // On macOS the label is always visible, so LabeledContent is not necessary.
            TextField("Animal", text: $animal)
            #else
            // Wrap in a labeled content to provide a label that is always visible.
            LabeledContent("Animal") {
                TextField("", text: $animal)
            }
            #endif
        }
        #if os(macOS)
        .formStyle(.grouped)
        #endif
        .labeledContentInteractiveFocus()
    }
}
```

### Use as a `LabeledContentStyle`
You can use `interactiveFocus` as a shorthand for `InteractiveFocusLabeledContentStyle()`.

```swift
struct ContentView: View {
    @State private var productMaterial = ""
    var body: some View {
        LabeledContent {
            TextField("", text: $productMaterial)
        } label: {
            Text("Product Material").bold()
        }
        .labeledContentStyle(.interactiveFocus)
    }
}
```

## Requirements
- iOS 16+
- macOS 13+
- Swift 5.7+
