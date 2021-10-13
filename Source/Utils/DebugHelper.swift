//
//  DebugHelper.swift
//  Homeat
//
//  Created by macbook pro on 27/5/2021.
//

import Foundation

class DebugHelper {
    
    static var TAG_APP = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as! String

    static func debug(_ items: Any..., fileName: String = #file,
        functionName: String = #function,
        lineNumber: Int = #line,
        columnNumber: Int = #column) {
        print(TAG_APP, "Debug:", (fileName as NSString).lastPathComponent.components(separatedBy: ".")[0], functionName.components(separatedBy: "(")[0], "at line \(lineNumber)", items)
    }

    static func error(_ items: Any..., fileName: String = #file,
        functionName: String = #function,
        lineNumber: Int = #line,
        columnNumber: Int = #column) {
        print(TAG_APP, "Error:", (fileName as NSString).lastPathComponent.components(separatedBy: ".")[0], functionName.components(separatedBy: "(")[0], "at line \(lineNumber)", items)
    }

    static func info(_ items: Any..., fileName: String = #file,
        functionName: String = #function,
        lineNumber: Int = #line,
        columnNumber: Int = #column) {
        print(TAG_APP, "Info:", (fileName as NSString).lastPathComponent.components(separatedBy: ".")[0], functionName.components(separatedBy: "(")[0], "at line \(lineNumber)", items)
    }

    static func warning(_ items: Any..., fileName: String = #file,
        functionName: String = #function,
        lineNumber: Int = #line,
        columnNumber: Int = #column) {
        print(TAG_APP, "Warning:", (fileName as NSString).lastPathComponent.components(separatedBy: ".")[0], functionName.components(separatedBy: "(")[0], "at line \(lineNumber)", items)
    }
}
