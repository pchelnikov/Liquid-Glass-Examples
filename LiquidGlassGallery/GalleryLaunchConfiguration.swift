import SwiftUI

/// Debug-only entry points make individual examples reproducible during UI checks.
enum GalleryLaunchConfiguration {
  static var presentsDemo: Bool {
    #if DEBUG
      ProcessInfo.processInfo.arguments.contains("--present-demo")
    #else
      false
    #endif
  }

  static var example: ExampleID? {
    #if DEBUG
      let arguments = ProcessInfo.processInfo.arguments
      if let index = arguments.firstIndex(of: "--example"),
        arguments.indices.contains(index + 1),
        let example = ExampleID(rawValue: arguments[index + 1])
      {
        return example
      }
    #endif
    return nil
  }
}
