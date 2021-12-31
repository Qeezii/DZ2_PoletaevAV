//
//  Article+Id.swift
//  DZ2_PoletaevAV
//
//  Created by Алексей Полетаев on 31.12.2021.
//

import Networking

extension Article: Identifiable {
    public var id: String { url }
}
