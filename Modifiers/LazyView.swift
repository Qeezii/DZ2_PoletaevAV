//
//  LazyView.swift
//  DZ2_PoletaevAV
//
//  Created by Алексей Полетаев on 28.12.2021.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    private let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}

extension View {
    var lazy: some View {
        LazyView(self)
    }
}
