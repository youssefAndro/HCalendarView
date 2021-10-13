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
            targets: ["HCalendarView"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HCalendarView",
            dependencies: []),
    ],
    swiftLanguageVersions: [.v5]
)