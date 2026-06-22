import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @errorMessages_____.
  ///
  /// In en, this message translates to:
  /// **'___Comment___'**
  String get errorMessages_____;

  /// No description provided for @connectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout with server ⌛'**
  String get connectionTimeout;

  /// No description provided for @sendTimeout.
  ///
  /// In en, this message translates to:
  /// **'Send timeout in connection with server ⏱'**
  String get sendTimeout;

  /// No description provided for @receiveTimeout.
  ///
  /// In en, this message translates to:
  /// **'Receive timeout in connection with server ⏰'**
  String get receiveTimeout;

  /// No description provided for @requestCancelled.
  ///
  /// In en, this message translates to:
  /// **'Request to server was cancelled ✖'**
  String get requestCancelled;

  /// No description provided for @sessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Session expired, please login again 🔑'**
  String get sessionExpired;

  /// No description provided for @localSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save data locally 💾'**
  String get localSaveFailed;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'No Internet connection 😑'**
  String get connectionError;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong 🤔'**
  String get unknownError;

  /// No description provided for @badCertificate.
  ///
  /// In en, this message translates to:
  /// **'The certificate provided by the server is not valid 📜'**
  String get badCertificate;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong 🤔'**
  String get somethingWentWrong;

  /// No description provided for @badRequest.
  ///
  /// In en, this message translates to:
  /// **'Bad request format 👎'**
  String get badRequest;

  /// No description provided for @couldNotFindSource.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t find the source 😲'**
  String get couldNotFindSource;

  /// No description provided for @validationFunctions____________.
  ///
  /// In en, this message translates to:
  /// **'\$\$\$ Comment \$\$\$'**
  String get validationFunctions____________;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get fieldRequired;

  /// No description provided for @pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name.'**
  String get pleaseEnterName;

  /// No description provided for @pleaseEnterUserName.
  ///
  /// In en, this message translates to:
  /// **'Please enter user name.'**
  String get pleaseEnterUserName;

  /// No description provided for @userNameLength.
  ///
  /// In en, this message translates to:
  /// **'Username must be between 3 and 16 characters long.'**
  String get userNameLength;

  /// No description provided for @userNameTooShort.
  ///
  /// In en, this message translates to:
  /// **'Username must be at least 3 characters long.'**
  String get userNameTooShort;

  /// No description provided for @userNameTooLong.
  ///
  /// In en, this message translates to:
  /// **'Username cannot exceed 16 characters.'**
  String get userNameTooLong;

  /// No description provided for @userNameRules.
  ///
  /// In en, this message translates to:
  /// **'Username can only contain letters, numbers, and underscores.'**
  String get userNameRules;

  /// No description provided for @invalidFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid full name (e.g. John Doe)'**
  String get invalidFullName;

  /// No description provided for @invalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 chars, include uppercase, lowercase, number & special character'**
  String get invalidPassword;

  /// No description provided for @invalidGender.
  ///
  /// In en, this message translates to:
  /// **'Invalid gender, it should be either \'Male\' or \'Female\''**
  String get invalidGender;

  /// No description provided for @passwordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long.'**
  String get passwordLength;

  /// No description provided for @uppercaseRulePassword.
  ///
  /// In en, this message translates to:
  /// **'At least one uppercase letter is required.'**
  String get uppercaseRulePassword;

  /// No description provided for @lowercaseRulePassword.
  ///
  /// In en, this message translates to:
  /// **'At least one lowercase letter is required.'**
  String get lowercaseRulePassword;

  /// No description provided for @digitRulePassword.
  ///
  /// In en, this message translates to:
  /// **'At least one digit is required.'**
  String get digitRulePassword;

  /// No description provided for @specialCharactersRulePassword.
  ///
  /// In en, this message translates to:
  /// **'At least one special character is required (e.g. #?!@\$%^&*-).'**
  String get specialCharactersRulePassword;

  /// No description provided for @pleaseEnterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Please enter first name.'**
  String get pleaseEnterFirstName;

  /// No description provided for @pleaseEnterLastName.
  ///
  /// In en, this message translates to:
  /// **'Please enter last name.'**
  String get pleaseEnterLastName;

  /// No description provided for @namesRules.
  ///
  /// In en, this message translates to:
  /// **'Names can only have alphabetic characters.'**
  String get namesRules;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your Email.'**
  String get pleaseEnterEmail;

  /// No description provided for @pleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get pleaseEnterValidEmail;

  /// No description provided for @pleaseEnterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number.'**
  String get pleaseEnterPhoneNumber;

  /// No description provided for @phoneNumberRules.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid Egyptian phone number (+20XXXXXXXXXX)'**
  String get phoneNumberRules;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password.'**
  String get pleaseEnterPassword;

  /// No description provided for @pleaseConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Please confirm password.'**
  String get pleaseConfirmPassword;

  /// No description provided for @namesLengthRule.
  ///
  /// In en, this message translates to:
  /// **'Names must be at least three characters long.'**
  String get namesLengthRule;

  /// No description provided for @noMatch.
  ///
  /// In en, this message translates to:
  /// **'No Match!'**
  String get noMatch;

  /// No description provided for @homeScreen.
  ///
  /// In en, this message translates to:
  /// **'Home Screen'**
  String get homeScreen;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @googlePlayServicesMissingMessage.
  ///
  /// In en, this message translates to:
  /// **'This device does not have Google Play Services. Some features, such as notifications or location services, may not work correctly.'**
  String get googlePlayServicesMissingMessage;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @welcomeToTamyez.
  ///
  /// In en, this message translates to:
  /// **'Welcome To TAMYEZ'**
  String get welcomeToTamyez;

  /// No description provided for @discoverStrengthAndPathMessage.
  ///
  /// In en, this message translates to:
  /// **'Discover your strengths and find your ideal path'**
  String get discoverStrengthAndPathMessage;

  /// No description provided for @discoverYourTruePotential.
  ///
  /// In en, this message translates to:
  /// **'Discover your true potential and unlock the career path meant for you.'**
  String get discoverYourTruePotential;

  /// No description provided for @discoverYourTruePotentialTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover Your True\nPotential'**
  String get discoverYourTruePotentialTitle;

  /// No description provided for @discoverYourTruePotentialSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock your unique strengths and find the\nperfect career path with our AI-powered\nassistant.'**
  String get discoverYourTruePotentialSubtitle;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @chooseYourLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get chooseYourLanguage;

  /// No description provided for @selectYourPreferredLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred language to use Tamyez easily'**
  String get selectYourPreferredLanguage;

  /// No description provided for @continueWord.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueWord;

  /// No description provided for @loginScreen.
  ///
  /// In en, this message translates to:
  /// **'Login Screen'**
  String get loginScreen;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @resendVerificationEmail.
  ///
  /// In en, this message translates to:
  /// **'Resend verification email'**
  String get resendVerificationEmail;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @orSignInWith.
  ///
  /// In en, this message translates to:
  /// **'Or sign in with'**
  String get orSignInWith;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAnAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login Success!'**
  String get loginSuccess;

  /// No description provided for @signUpSuccess.
  ///
  /// In en, this message translates to:
  /// **'Sign Up Success! Check your inbox for verification link ✉'**
  String get signUpSuccess;

  /// No description provided for @otpResentSuccess.
  ///
  /// In en, this message translates to:
  /// **'OTP code has been resent successfully'**
  String get otpResentSuccess;

  /// No description provided for @resetPasswordSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password has been reset successfully'**
  String get resetPasswordSuccess;

  /// No description provided for @forgetPasswordEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Reset code has been sent to your email'**
  String get forgetPasswordEmailSent;

  /// No description provided for @otpVerifiedSuccess.
  ///
  /// In en, this message translates to:
  /// **'OTP code verified successfully'**
  String get otpVerifiedSuccess;

  /// No description provided for @googleLoginFailed.
  ///
  /// In en, this message translates to:
  /// **'Google login failed'**
  String get googleLoginFailed;

  /// No description provided for @googleLoginNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Google login is not supported'**
  String get googleLoginNotSupported;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @orSignUpWith.
  ///
  /// In en, this message translates to:
  /// **'Or sign up with'**
  String get orSignUpWith;

  /// No description provided for @termsAndPrivacy.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our Terms of Service and Privacy Policy'**
  String get termsAndPrivacy;

  /// No description provided for @pleaseEnterEmailAssociated.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email associated to your account'**
  String get pleaseEnterEmailAssociated;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @passwordRequirements.
  ///
  /// In en, this message translates to:
  /// **'Password must not be empty and must contain 6 characters with upper case letter and one number at least'**
  String get passwordRequirements;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password'**
  String get enterNewPassword;

  /// No description provided for @emailVerification.
  ///
  /// In en, this message translates to:
  /// **'Email verification'**
  String get emailVerification;

  /// No description provided for @enterCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Please enter your code that send to your email address'**
  String get enterCodeSent;

  /// No description provided for @invalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid code'**
  String get invalidCode;

  /// No description provided for @didNotReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code? '**
  String get didNotReceiveCode;

  /// No description provided for @resent.
  ///
  /// In en, this message translates to:
  /// **'Resent'**
  String get resent;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @loginBadResponse.
  ///
  /// In en, this message translates to:
  /// **'The server returned an invalid login response'**
  String get loginBadResponse;

  /// No description provided for @quizBadResponse.
  ///
  /// In en, this message translates to:
  /// **'The server returned an invalid quiz response'**
  String get quizBadResponse;

  /// No description provided for @checkCareerAssessmentAnswersBadResponse.
  ///
  /// In en, this message translates to:
  /// **'The server returned an invalid career assessment result.'**
  String get checkCareerAssessmentAnswersBadResponse;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @checkingAnswers.
  ///
  /// In en, this message translates to:
  /// **'Checking your answers...\nThis may take a few seconds'**
  String get checkingAnswers;

  /// No description provided for @topCareers.
  ///
  /// In en, this message translates to:
  /// **'Top Careers'**
  String get topCareers;

  /// No description provided for @yourTopCareerMatches.
  ///
  /// In en, this message translates to:
  /// **'Your Top Career Matches'**
  String get yourTopCareerMatches;

  /// No description provided for @confidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence: '**
  String get confidence;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @questionCounter.
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String questionCounter(int current, int total);

  /// No description provided for @tamyez.
  ///
  /// In en, this message translates to:
  /// **'TAMYEZ'**
  String get tamyez;

  /// No description provided for @verifyYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get verifyYourEmail;

  /// No description provided for @verifyEmailMessage.
  ///
  /// In en, this message translates to:
  /// **'Please verify your email address to continue.\nWe\'ve sent a verification link to your inbox.'**
  String get verifyEmailMessage;

  /// No description provided for @didNotReceiveEmailCheckSpam.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the email? Check your spam folder '**
  String get didNotReceiveEmailCheckSpam;

  /// No description provided for @careerOverview.
  ///
  /// In en, this message translates to:
  /// **'Career Overview'**
  String get careerOverview;

  /// No description provided for @roadmapPreview.
  ///
  /// In en, this message translates to:
  /// **'Roadmap Preview'**
  String get roadmapPreview;

  /// No description provided for @courses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get courses;

  /// No description provided for @books.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// No description provided for @youtubeExplanations.
  ///
  /// In en, this message translates to:
  /// **'YouTube Explanations'**
  String get youtubeExplanations;

  /// No description provided for @resourceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Language: {language} • {type}'**
  String resourceSubtitle(String language, String type);

  /// No description provided for @failedToOpenUrl.
  ///
  /// In en, this message translates to:
  /// **'Failed to open URL'**
  String get failedToOpenUrl;

  /// No description provided for @writeYourAnswerHere.
  ///
  /// In en, this message translates to:
  /// **'Write your answer here'**
  String get writeYourAnswerHere;

  /// No description provided for @tokenExpiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Token Expired!'**
  String get tokenExpiredTitle;

  /// No description provided for @tokenExpiredContent.
  ///
  /// In en, this message translates to:
  /// **'Please, re-login again'**
  String get tokenExpiredContent;

  /// No description provided for @goToLogin.
  ///
  /// In en, this message translates to:
  /// **'Go to Login'**
  String get goToLogin;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'TAMYEZ App, Our Graduation Project.'**
  String get appTitle;

  /// No description provided for @routingError.
  ///
  /// In en, this message translates to:
  /// **'Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments'**
  String get routingError;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// No description provided for @frozen.
  ///
  /// In en, this message translates to:
  /// **'Frozen'**
  String get frozen;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// No description provided for @careerRoadmap.
  ///
  /// In en, this message translates to:
  /// **'Career Roadmap'**
  String get careerRoadmap;

  /// No description provided for @overallProgress.
  ///
  /// In en, this message translates to:
  /// **'Overall Progress'**
  String get overallProgress;

  /// No description provided for @postCourseQuiz.
  ///
  /// In en, this message translates to:
  /// **'Post-Course Quiz'**
  String get postCourseQuiz;

  /// No description provided for @postCourseQuizDescription.
  ///
  /// In en, this message translates to:
  /// **'Test your knowledge with a quick quiz after completing this step.'**
  String get postCourseQuizDescription;

  /// No description provided for @takeQuiz.
  ///
  /// In en, this message translates to:
  /// **'Take Quiz'**
  String get takeQuiz;

  /// No description provided for @yourPathToSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your Path to Success'**
  String get yourPathToSuccess;

  /// No description provided for @lockedOrFrozenMessage.
  ///
  /// In en, this message translates to:
  /// **'This step is locked or frozen'**
  String get lockedOrFrozenMessage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
