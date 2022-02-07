// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Description onboard page 1
  internal static let intro1Description = L10n.tr("Localizable", "intro_1_description")
  /// Onboard Page 1
  internal static let intro1Title = L10n.tr("Localizable", "intro_1_title")
  /// Description onboard page 2
  internal static let intro2Description = L10n.tr("Localizable", "intro_2_description")
  /// Onboard Page 2
  internal static let intro2Title = L10n.tr("Localizable", "intro_2_title")
  /// Description onboard page 3
  internal static let intro3Description = L10n.tr("Localizable", "intro_3_description")
  /// Onboard Page 3
  internal static let intro3Title = L10n.tr("Localizable", "intro_3_title")
  /// Description onboard page 4
  internal static let intro4Description = L10n.tr("Localizable", "intro_4_description")
  /// Onboard Page 4
  internal static let intro4Title = L10n.tr("Localizable", "intro_4_title")
  /// Description onboard page 5
  internal static let intro5Description = L10n.tr("Localizable", "intro_5_description")
  /// Onboard Page 5
  internal static let intro5Title = L10n.tr("Localizable", "intro_5_title")
  /// Login
  internal static let login = L10n.tr("Localizable", "login")
  /// Password
  internal static let password = L10n.tr("Localizable", "password")
  /// Submit
  internal static let submit = L10n.tr("Localizable", "submit")
  /// Movie
  internal static let title = L10n.tr("Localizable", "title")
  /// Username or Email
  internal static let usernameOrEmail = L10n.tr("Localizable", "username_or_email")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
