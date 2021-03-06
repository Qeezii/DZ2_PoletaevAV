//
//  View+Any.swift
//  SwiftUINavigation
//
//  Created by Anna Zharkova on 06.09.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import SwiftUI

extension View {
   public func toAnyView() -> AnyView {
        AnyView(self)
    }
}

extension EnvironmentObject {
    public var hasValue: Bool {
        !String(describing: self).contains("_store: nil")
    }
}
