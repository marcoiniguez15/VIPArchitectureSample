//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 9 nibs.
  struct nib {
    /// Nib `ArtistTableViewCell`.
    static let artistTableViewCell = _R.nib._ArtistTableViewCell()
    /// Nib `ArtistsListView`.
    static let artistsListView = _R.nib._ArtistsListView()
    /// Nib `CharacterDetailMarvelTableViewCell`.
    static let characterDetailMarvelTableViewCell = _R.nib._CharacterDetailMarvelTableViewCell()
    /// Nib `CharacterDetailMarvelView`.
    static let characterDetailMarvelView = _R.nib._CharacterDetailMarvelView()
    /// Nib `CharacterListMarvelTableViewCell`.
    static let characterListMarvelTableViewCell = _R.nib._CharacterListMarvelTableViewCell()
    /// Nib `CharactersListMarvelView`.
    static let charactersListMarvelView = _R.nib._CharactersListMarvelView()
    /// Nib `CharactersListRickMortyTableViewCell`.
    static let charactersListRickMortyTableViewCell = _R.nib._CharactersListRickMortyTableViewCell()
    /// Nib `CharactersListRickMortyView`.
    static let charactersListRickMortyView = _R.nib._CharactersListRickMortyView()
    /// Nib `InitialSelectionView`.
    static let initialSelectionView = _R.nib._InitialSelectionView()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "ArtistTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.artistTableViewCell) instead")
    static func artistTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.artistTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "ArtistsListView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.artistsListView) instead")
    static func artistsListView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.artistsListView)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "CharacterDetailMarvelTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.characterDetailMarvelTableViewCell) instead")
    static func characterDetailMarvelTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.characterDetailMarvelTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "CharacterDetailMarvelView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.characterDetailMarvelView) instead")
    static func characterDetailMarvelView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.characterDetailMarvelView)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "CharacterListMarvelTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.characterListMarvelTableViewCell) instead")
    static func characterListMarvelTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.characterListMarvelTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "CharactersListMarvelView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.charactersListMarvelView) instead")
    static func charactersListMarvelView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.charactersListMarvelView)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "CharactersListRickMortyTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.charactersListRickMortyTableViewCell) instead")
    static func charactersListRickMortyTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.charactersListRickMortyTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "CharactersListRickMortyView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.charactersListRickMortyView) instead")
    static func charactersListRickMortyView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.charactersListRickMortyView)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "InitialSelectionView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.initialSelectionView) instead")
    static func initialSelectionView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.initialSelectionView)
    }
    #endif

    static func artistTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ArtistTableViewCell? {
      return R.nib.artistTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ArtistTableViewCell
    }

    static func artistsListView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.artistsListView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func characterDetailMarvelTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CharacterDetailMarvelTableViewCell? {
      return R.nib.characterDetailMarvelTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CharacterDetailMarvelTableViewCell
    }

    static func characterDetailMarvelView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.characterDetailMarvelView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func characterListMarvelTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CharacterListMarvelTableViewCell? {
      return R.nib.characterListMarvelTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CharacterListMarvelTableViewCell
    }

    static func charactersListMarvelView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.charactersListMarvelView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func charactersListRickMortyTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CharactersListRickMortyTableViewCell? {
      return R.nib.charactersListRickMortyTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CharactersListRickMortyTableViewCell
    }

    static func charactersListRickMortyView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.charactersListRickMortyView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func initialSelectionView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.initialSelectionView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 4 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `ArtistTableViewCell`.
    static let artistTableViewCell: Rswift.ReuseIdentifier<ArtistTableViewCell> = Rswift.ReuseIdentifier(identifier: "ArtistTableViewCell")
    /// Reuse identifier `CharacterDetailMarvelTableViewCell`.
    static let characterDetailMarvelTableViewCell: Rswift.ReuseIdentifier<CharacterDetailMarvelTableViewCell> = Rswift.ReuseIdentifier(identifier: "CharacterDetailMarvelTableViewCell")
    /// Reuse identifier `CharacterListMarvelTableViewCell`.
    static let characterListMarvelTableViewCell: Rswift.ReuseIdentifier<CharacterListMarvelTableViewCell> = Rswift.ReuseIdentifier(identifier: "CharacterListMarvelTableViewCell")
    /// Reuse identifier `CharactersListRickMortyTableViewCell`.
    static let charactersListRickMortyTableViewCell: Rswift.ReuseIdentifier<CharactersListRickMortyTableViewCell> = Rswift.ReuseIdentifier(identifier: "CharactersListRickMortyTableViewCell")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _ArtistTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = ArtistTableViewCell

      let bundle = R.hostingBundle
      let identifier = "ArtistTableViewCell"
      let name = "ArtistTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ArtistTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ArtistTableViewCell
      }

      fileprivate init() {}
    }

    struct _ArtistsListView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "ArtistsListView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _CharacterDetailMarvelTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = CharacterDetailMarvelTableViewCell

      let bundle = R.hostingBundle
      let identifier = "CharacterDetailMarvelTableViewCell"
      let name = "CharacterDetailMarvelTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CharacterDetailMarvelTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CharacterDetailMarvelTableViewCell
      }

      fileprivate init() {}
    }

    struct _CharacterDetailMarvelView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "CharacterDetailMarvelView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _CharacterListMarvelTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = CharacterListMarvelTableViewCell

      let bundle = R.hostingBundle
      let identifier = "CharacterListMarvelTableViewCell"
      let name = "CharacterListMarvelTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CharacterListMarvelTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CharacterListMarvelTableViewCell
      }

      fileprivate init() {}
    }

    struct _CharactersListMarvelView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "CharactersListMarvelView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _CharactersListRickMortyTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = CharactersListRickMortyTableViewCell

      let bundle = R.hostingBundle
      let identifier = "CharactersListRickMortyTableViewCell"
      let name = "CharactersListRickMortyTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CharactersListRickMortyTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CharactersListRickMortyTableViewCell
      }

      fileprivate init() {}
    }

    struct _CharactersListRickMortyView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "CharactersListRickMortyView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _InitialSelectionView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "InitialSelectionView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = ViewController

      let bundle = R.hostingBundle
      let name = "Main"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
