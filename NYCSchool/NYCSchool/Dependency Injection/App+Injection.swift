//
//  App+Injection.swift
//  NYCSchool
//
//  Created by Rakesh Shetty on 11/3/22.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { SchoolActionImp() }
        .implements(SchoolAction.self)
        .scope(.unique)

        register { SchoolView() }
        .scope(.unique)

        register { SchoolViewModel() }
        .scope(.unique)
    }
}
