//
//  TitleButtonModifier.swift
//  DZ2_PoletaevAV
//
//  Created by Алексей Полетаев on 31.12.2021.
//

import SwiftUI

struct TitleButtonModifier: ViewModifier {
    
    var showed: Bool
    
    var animation: Animation {
        Animation.spring(response: 0.5)
    }
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.gray)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black,
                    radius: 3,
                    x: showed ? 0 : 3,
                    y: showed ? 0 : 10)
            .offset(x: showed ? 3 : 0,
                    y: showed ? 10 : 0)
            .animation(animation)
    }
}
