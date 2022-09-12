// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// Hello, John
  public static let userName = L10n.tr("Localizable", "user_name")

  public enum Alert {
    /// ok
    public static let ok = L10n.tr("Localizable", "alert.ok")
  }

  public enum Error {
    /// Error
    public static let common = L10n.tr("Localizable", "error.common")
    /// It seems something went wrong, please try again later.
    public static let somethingWrong = L10n.tr("Localizable", "error.something_wrong")
  }

  public enum Field {
    /// Search for recipes
    public static let search = L10n.tr("Localizable", "field.search")
  }

  public enum Label {
    /// Ingredients
    public static let ingredients = L10n.tr("Localizable", "label.Ingredients")
    /// Like
    public static let like = L10n.tr("Localizable", "label.like")
    /// Loading...
    public static let loading = L10n.tr("Localizable", "label.loading")
    /// mins
    public static let mins = L10n.tr("Localizable", "label.mins")
    /// NA
    public static let notAvailable = L10n.tr("Localizable", "label.not_available")
    /// servings
    public static let servings = L10n.tr("Localizable", "label.servings")
    /// Steps
    public static let steps = L10n.tr("Localizable", "label.steps")
    /// Summary
    public static let summary = L10n.tr("Localizable", "label.summary")
  }

  public enum Title {
    /// What would you like to cook today?
    public static let mainHeader = L10n.tr("Localizable", "title.main_header")
  }
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
