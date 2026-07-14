import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'neurogine_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of NeurogineLocalizations
/// returned by `NeurogineLocalizations.of(context)`.
///
/// Applications need to include `NeurogineLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/neurogine_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: NeurogineLocalizations.localizationsDelegates,
///   supportedLocales: NeurogineLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the NeurogineLocalizations.supportedLocales
/// property.
abstract class NeurogineLocalizations {
  NeurogineLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static NeurogineLocalizations? of(BuildContext context) {
    return Localizations.of<NeurogineLocalizations>(
      context,
      NeurogineLocalizations,
    );
  }

  static const LocalizationsDelegate<NeurogineLocalizations> delegate =
      _NeurogineLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Expense Tracker'**
  String get appTitle;

  /// No description provided for @navigationHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navigationHome;

  /// No description provided for @navigationSummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get navigationSummary;

  /// No description provided for @dialogAddNewExpense.
  ///
  /// In en, this message translates to:
  /// **'Add New Expense'**
  String get dialogAddNewExpense;

  /// No description provided for @dialogEditExpense.
  ///
  /// In en, this message translates to:
  /// **'Edit Expense'**
  String get dialogEditExpense;

  /// No description provided for @dialogSearchExpenses.
  ///
  /// In en, this message translates to:
  /// **'Search Expenses'**
  String get dialogSearchExpenses;

  /// No description provided for @inputFieldName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get inputFieldName;

  /// No description provided for @inputFieldAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get inputFieldAmount;

  /// No description provided for @inputFieldDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get inputFieldDate;

  /// No description provided for @inputFieldSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get inputFieldSearch;

  /// No description provided for @tooltipAddNewExpense.
  ///
  /// In en, this message translates to:
  /// **'Add new expense'**
  String get tooltipAddNewExpense;

  /// No description provided for @tooltipGenerateExpenses.
  ///
  /// In en, this message translates to:
  /// **'Generate new expenses'**
  String get tooltipGenerateExpenses;

  /// No description provided for @tooltipDeleteAllExpenses.
  ///
  /// In en, this message translates to:
  /// **'Delete all expenses'**
  String get tooltipDeleteAllExpenses;

  /// No description provided for @tooltipSearchExpense.
  ///
  /// In en, this message translates to:
  /// **'Search expenses'**
  String get tooltipSearchExpense;

  /// No description provided for @summaryAmountSpent.
  ///
  /// In en, this message translates to:
  /// **'Amount Spent'**
  String get summaryAmountSpent;

  /// No description provided for @summaryTotalTransaction.
  ///
  /// In en, this message translates to:
  /// **'Total Transaction'**
  String get summaryTotalTransaction;

  /// No description provided for @summaryLatestTransaction.
  ///
  /// In en, this message translates to:
  /// **'Latest Transaction'**
  String get summaryLatestTransaction;

  /// No description provided for @summaryEarliestTransaction.
  ///
  /// In en, this message translates to:
  /// **'Earliest Transaction'**
  String get summaryEarliestTransaction;

  /// No description provided for @buttonSubmit.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT'**
  String get buttonSubmit;
}

class _NeurogineLocalizationsDelegate
    extends LocalizationsDelegate<NeurogineLocalizations> {
  const _NeurogineLocalizationsDelegate();

  @override
  Future<NeurogineLocalizations> load(Locale locale) {
    return SynchronousFuture<NeurogineLocalizations>(
      lookupNeurogineLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_NeurogineLocalizationsDelegate old) => false;
}

NeurogineLocalizations lookupNeurogineLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return NeurogineLocalizationsEn();
  }

  throw FlutterError(
    'NeurogineLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
