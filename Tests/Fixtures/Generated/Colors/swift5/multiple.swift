// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  var color: Color { return Color(named: self) }

  enum Colors {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#339666"></span>
    /// Alpha: 100% <br/> (0x339666ff)
    static let articleBody = ColorName(rgbaValue: 0x339666ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff66cc"></span>
    /// Alpha: 100% <br/> (0xff66ccff)
    static let articleFootnote = ColorName(rgbaValue: 0xff66ccff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#33fe66"></span>
    /// Alpha: 100% <br/> (0x33fe66ff)
    static let articleTitle = ColorName(rgbaValue: 0x33fe66ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
    /// Alpha: 80% <br/> (0xffffffcc)
    static let `private` = ColorName(rgbaValue: 0xffffffcc)
  }
  enum Extra {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#339666"></span>
    /// Alpha: 100% <br/> (0x339666ff)
    static let articleBody = ColorName(rgbaValue: 0x339666ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff66cc"></span>
    /// Alpha: 100% <br/> (0xff66ccff)
    static let articleFootnote = ColorName(rgbaValue: 0xff66ccff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#33fe66"></span>
    /// Alpha: 100% <br/> (0x33fe66ff)
    static let articleTitle = ColorName(rgbaValue: 0x33fe66ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff66cc"></span>
    /// Alpha: 100% <br/> (0xff66ccff)
    static let cyanColor = ColorName(rgbaValue: 0xff66ccff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
    /// Alpha: 80% <br/> (0xffffffcc)
    static let namedValue = ColorName(rgbaValue: 0xffffffcc)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
    /// Alpha: 80% <br/> (0xffffffcc)
    static let nestedNamedValue = ColorName(rgbaValue: 0xffffffcc)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
    /// Alpha: 80% <br/> (0xffffffcc)
    static let `private` = ColorName(rgbaValue: 0xffffffcc)
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map {
      CGFloat($0 & 0xff)
    }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
