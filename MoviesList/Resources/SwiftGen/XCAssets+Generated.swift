// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Colors {
    internal static let backgroundColor = ColorAsset(name: "backgroundColor")
    internal static let errorColor = ColorAsset(name: "errorColor")
    internal static let iconBG = ColorAsset(name: "iconBG")
    internal static let mainBlue = ColorAsset(name: "mainBlue")
    internal static let mainPurple = ColorAsset(name: "mainPurple")
    internal static let notes = ImageAsset(name: "notes")
    internal static let textFieldGrey = ColorAsset(name: "textFieldGrey")
    internal static let textGray = ColorAsset(name: "textGray")
    internal static let white = ColorAsset(name: "white")
  }
  internal enum Images {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let addNote = ImageAsset(name: "addNote")
    internal static let appIcon = ImageAsset(name: "appIcon")
    internal static let avatar = ImageAsset(name: "avatar")
    internal static let babylon = ImageAsset(name: "babylon")
    internal static let back = ImageAsset(name: "back")
    internal static let bin = ImageAsset(name: "bin")
    internal static let brad = ImageAsset(name: "brad")
    internal static let clock = ImageAsset(name: "clock")
    internal static let diego = ImageAsset(name: "diego")
    internal static let django = ImageAsset(name: "django")
    internal static let email = ImageAsset(name: "email")
    internal static let eye = ImageAsset(name: "eye")
    internal static let eyeSlash = ImageAsset(name: "eyeSlash")
    internal static let fast = ImageAsset(name: "fast")
    internal static let favorite = ImageAsset(name: "favorite")
    internal static let filter = ImageAsset(name: "filter")
    internal static let gear = ImageAsset(name: "gear")
    internal static let gentelmen = ImageAsset(name: "gentelmen")
    internal static let heart = ImageAsset(name: "heart")
    internal static let hollywood = ImageAsset(name: "hollywood")
    internal static let home = ImageAsset(name: "home")
    internal static let inception = ImageAsset(name: "inception")
    internal static let later = ImageAsset(name: "later")
    internal static let lock = ImageAsset(name: "lock")
    internal static let login = ImageAsset(name: "login")
    internal static let margot = ImageAsset(name: "margot")
    internal static let negr = ImageAsset(name: "negr")
    internal static let newPassword = ImageAsset(name: "newPassword")
    internal static let notes = ImageAsset(name: "notes")
    internal static let otp = ImageAsset(name: "otp")
    internal static let pencil = ImageAsset(name: "pencil")
    internal static let person = ImageAsset(name: "person")
    internal static let play = ImageAsset(name: "play")
    internal static let plus = ImageAsset(name: "plus")
    internal static let profile = ImageAsset(name: "profile")
    internal static let pulp = ImageAsset(name: "pulp")
    internal static let resetPassword = ImageAsset(name: "resetPassword")
    internal static let star = ImageAsset(name: "star")
    internal static let watched = ImageAsset(name: "watched")
    internal static let world = ImageAsset(name: "world")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

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
