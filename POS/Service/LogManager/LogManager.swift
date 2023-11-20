//
//  Pretty.swift
//  POS
//
//  Created by Jihoon on 2023/11/06.
//

import Foundation
import SwiftPrettyPrint

// Debug.swift
#if canImport(SwiftPrettyPrint)
    import SwiftPrettyPrint
    typealias Debug = SwiftPrettyPrint.Pretty // You can use short alias such as `D` too.
#endif
