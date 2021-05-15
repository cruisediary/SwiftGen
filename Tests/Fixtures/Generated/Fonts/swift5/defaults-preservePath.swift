// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
typealias Font = FontConvertible.Font

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
enum FontFamily {
  enum SFNSDisplay {
    static let black = FontConvertible(name: ".SFNSDisplay-Black", family: ".SF NS Display", path: "Fonts/SFNSDisplay-Black.otf")
    static let bold = FontConvertible(name: ".SFNSDisplay-Bold", family: ".SF NS Display", path: "Fonts/SFNSDisplay-Bold.otf")
    static let heavy = FontConvertible(name: ".SFNSDisplay-Heavy", family: ".SF NS Display", path: "Fonts/SFNSDisplay-Heavy.otf")
    static let regular = FontConvertible(name: ".SFNSDisplay-Regular", family: ".SF NS Display", path: "Fonts/SFNSDisplay-Regular.otf")
    static let all: [FontConvertible] = [black, bold, heavy, regular]
  }
  enum SFNSText {
    static let bold = FontConvertible(name: ".SFNSText-Bold", family: ".SF NS Text", path: "Fonts/SFNSText-Bold.otf")
    static let heavy = FontConvertible(name: ".SFNSText-Heavy", family: ".SF NS Text", path: "Fonts/SFNSText-Heavy.otf")
    static let regular = FontConvertible(name: ".SFNSText-Regular", family: ".SF NS Text", path: "Fonts/SFNSText-Regular.otf")
    static let all: [FontConvertible] = [bold, heavy, regular]
  }
  enum Avenir {
    static let black = FontConvertible(name: "Avenir-Black", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let blackOblique = FontConvertible(name: "Avenir-BlackOblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let book = FontConvertible(name: "Avenir-Book", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let bookOblique = FontConvertible(name: "Avenir-BookOblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let heavy = FontConvertible(name: "Avenir-Heavy", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let heavyOblique = FontConvertible(name: "Avenir-HeavyOblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let light = FontConvertible(name: "Avenir-Light", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let lightOblique = FontConvertible(name: "Avenir-LightOblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let medium = FontConvertible(name: "Avenir-Medium", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let mediumOblique = FontConvertible(name: "Avenir-MediumOblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let oblique = FontConvertible(name: "Avenir-Oblique", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let roman = FontConvertible(name: "Avenir-Roman", family: "Avenir", path: "Fonts/Avenir.ttc")
    static let all: [FontConvertible] = [black, blackOblique, book, bookOblique, heavy, heavyOblique, light, lightOblique, medium, mediumOblique, oblique, roman]
  }
  enum ZapfDingbats {
    static let regular = FontConvertible(name: "ZapfDingbatsITC", family: "Zapf Dingbats", path: "Fonts/ZapfDingbats.ttf")
    static let all: [FontConvertible] = [regular]
  }
  enum Public {
    static let `internal` = FontConvertible(name: "private", family: "public", path: "Fonts/class.ttf")
    static let all: [FontConvertible] = [`internal`]
  }
  static let allCustomFonts: [FontConvertible] = [SFNSDisplay.all, SFNSText.all, Avenir.all, ZapfDingbats.all, Public.all].flatMap { $0 }
  static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

struct FontConvertible {
  let name: String
  let family: String
  let path: String

  #if os(OSX)
  typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  typealias Font = UIFont
  #endif

  internal func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

extension FontConvertible.Font {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
