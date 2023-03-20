//
//  Package.swift
//  SCPFondation
//
//  Created by zhufree on 2023/3/20.
//

import PackageDescription

let package = Package(
    name: "SCPFondation",
    products: [
        .library(name: "SCPFondation", targets: ["SCPFondation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/stephencelis/SQLite.swift.git", from: "0.14.1")
    ],
    targets: [

    ]
)

