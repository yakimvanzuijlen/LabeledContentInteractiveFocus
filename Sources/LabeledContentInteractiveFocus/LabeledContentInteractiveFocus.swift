//
//  LabeledContentInteractiveFocus.swift
//  LabeledContentInteractiveFocus
//
//  Created by Yakim van Zuijlen on 21/01/2025.
//

import SwiftUI

/// A `LabeledContentStyle` that moves focus to the content of `LabeledContent` when its label has been tapped.
///
/// To apply this style to labeled content, or to a view that contains
/// labeled content, use the ``SwiftUI/View/labeledContentStyle(_:)`` modifier.
///
/// You can also use ``SwiftUI/LabeledContentStyle/interactiveFocus`` to construct this style.
struct InteractiveFocusLabeledContentStyle: LabeledContentStyle {
    @FocusState private var isFocused: Bool
    func makeBody(configuration: Configuration) -> some View {
        LabeledContent {
            configuration.content
                .focused($isFocused)
        } label: {
            configuration.label
                .onTapGesture {
                    isFocused = true
                }
        }
    }
}

extension LabeledContentStyle where Self == InteractiveFocusLabeledContentStyle {
    /// A `LabeledContentStyle` that moves focus to the content of `LabeledContent` when its label has been tapped.
    ///
    /// To apply this style to labeled content, or to a view that contains
    /// labeled content, use the ``SwiftUI/View/labeledContentStyle(_:)`` modifier.
    static var interactiveFocus: InteractiveFocusLabeledContentStyle { .init() }
}

extension View {
    /// Moves focus to the content of `LabeledContent` when its label has been tapped.
    ///
    /// When labeled content contains a text field tapping the label will move focus inside the text field.
    ///
    /// ```swift
    /// Form {
    ///     LabeledContent("Name") {
    ///         TextField("", text: $name)
    ///             .textContentType(.name)
    ///     }
    ///     LabeledContent("Password") {
    ///         SecureField("", text: $username)
    ///             .textContentType(.newPassword)
    ///     }
    /// }
    /// .labeledContentInteractiveFocus()
    /// ```
    func labeledContentInteractiveFocus() -> some View {
        labeledContentStyle(InteractiveFocusLabeledContentStyle())
    }
}
