// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Common {
    /// Localizable.strings
    ///   MoviesList
    /// 
    ///   Created by Daniil Markish on 23/03/2023.
    internal static let email = L10n.tr("Localizable", "Common.email", fallback: "Email")
    /// Nickname
    internal static let nickname = L10n.tr("Localizable", "Common.nickname", fallback: "Nickname")
    /// Password
    internal static let password = L10n.tr("Localizable", "Common.password", fallback: "Password")
  }
  internal enum Error {
    /// Decode Error
    internal static let decodeError = L10n.tr("Localizable", "Error.decodeError", fallback: "Decode Error")
    /// Invalid URL
    internal static let invalidURL = L10n.tr("Localizable", "Error.invalidURL", fallback: "Invalid URL")
    /// Internet connection error
    internal static let noConnection = L10n.tr("Localizable", "Error.noConnection", fallback: "Internet connection error")
    /// No Server Response
    internal static let noResponse = L10n.tr("Localizable", "Error.noResponse", fallback: "No Server Response")
    /// User is not authorized
    internal static let unauthorized = L10n.tr("Localizable", "Error.unauthorized", fallback: "User is not authorized")
    /// Unknown Error
    internal static let unknownError = L10n.tr("Localizable", "Error.unknownError", fallback: "Unknown Error")
  }
  internal enum Validation {
    /// Invalid email!
    internal static let email = L10n.tr("Localizable", "Validation.email", fallback: "Invalid email!")
    /// Your nickname must contain at least 3 characters
    internal static let nickname = L10n.tr("Localizable", "Validation.nickname", fallback: "Your nickname must contain at least 3 characters")
    /// Your password must contain at least 8 characters, numbers, at least 1 letter in uppercase and one special character!
    internal static let password = L10n.tr("Localizable", "Validation.password", fallback: "Your password must contain at least 8 characters, numbers, at least 1 letter in uppercase and one special character!")
    /// Password don't match
    internal static let passwordMatch = L10n.tr("Localizable", "Validation.passwordMatch", fallback: "Password don't match")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
