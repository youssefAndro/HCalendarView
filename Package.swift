import PackageDescription

let package = Package(
    name: "HCalendar",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "HCalendar",
            targets: ["HCalendar"]),
    ],
    dependencies: [],
    targets: [.target(name: "HCalendar",
                      path: "Source",
                      linkerSettings: [.linkedFramework("SwiftUIPager",
                                                        .when(platforms: [.iOS]))])
            ],
   
    swiftLanguageVersions: [.v5]
)
