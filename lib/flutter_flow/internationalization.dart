import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'd1d70dwf': {
      'en': 'Hello World',
      'ar': '',
    },
    'bxzhzz5i': {
      'en': 'Home',
      'ar': '',
    },
  },
  // LogingPage
  {
    '6qxobb1r': {
      'en': 'BEYOND CONSULTING',
      'ar': 'ما وراء الاستشارة',
    },
    '2qtwe1m0': {
      'en': 'MANAGEMENT AND BUSINESS CONSULTING',
      'ar': 'استشارات الإدارة والأعمال',
    },
    '9k8apshq': {
      'en': 'HELLO BEYONDER!',
      'ar': 'مرحبا بكم!',
    },
    'bzoyjww7': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'd719d929': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'n9ax8dnw': {
      'en': 'Forget Password',
      'ar': 'نسيت كلمة المرور',
    },
    '3vrtkvnj': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    '9sgvw8c8': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ForgotPasswordPage
  {
    '0m9en1wq': {
      'en': 'BEYOND CONSULTING',
      'ar': 'ما وراء الاستشارة',
    },
    'vtlxgzs6': {
      'en': 'MANAGEMENT AND BUSINESS CONSULTING',
      'ar': 'استشارات الإدارة والأعمال',
    },
    'kw4uh3t0': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    's591ptlh': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'dk4tuahv': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'di61in8n': {
      'en': 'Home',
      'ar': '',
    },
  },
  // MainDashBoardPage
  {
    'cxuwk8l9': {
      'en': 'Page Title',
      'ar': '',
    },
    'q3s2giuq': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SideNav
  {
    's6yt7m33': {
      'en': 'BEYOND CONSULTING',
      'ar': 'ما وراء الاستشارة',
    },
    '8z03ntxz': {
      'en': 'Management and Business Consulting',
      'ar': 'استشارات الإدارة والأعمال',
    },
    'zdq4e0la': {
      'en': 'Home',
      'ar': 'بيت',
    },
    'p7ziaqge': {
      'en': 'Main DashBoard',
      'ar': 'لوحة المعلومات الرئيسية',
    },
  },
  // Miscellaneous
  {
    'yagh9fqi': {
      'en': '',
      'ar': '',
    },
    'xr5ix56f': {
      'en': '',
      'ar': '',
    },
    '6znge1sv': {
      'en': '',
      'ar': '',
    },
    'f5tbh8rk': {
      'en': '',
      'ar': '',
    },
    'ra451quy': {
      'en': '',
      'ar': '',
    },
    '9ndvo8yb': {
      'en': '',
      'ar': '',
    },
    'xqowrm2t': {
      'en': '',
      'ar': '',
    },
    'a1v6fs20': {
      'en': '',
      'ar': '',
    },
    '1unwmmxp': {
      'en': '',
      'ar': '',
    },
    'gqly44lq': {
      'en': '',
      'ar': '',
    },
    'miodscwm': {
      'en': '',
      'ar': '',
    },
    'f5btubwh': {
      'en': '',
      'ar': '',
    },
    'be9zbybp': {
      'en': '',
      'ar': '',
    },
    'mdqjir2z': {
      'en': '',
      'ar': '',
    },
    '087wlris': {
      'en': '',
      'ar': '',
    },
    'et3pfruk': {
      'en': '',
      'ar': '',
    },
    'gljkrlx0': {
      'en': '',
      'ar': '',
    },
    'p87cyizs': {
      'en': '',
      'ar': '',
    },
    's8jluyfq': {
      'en': '',
      'ar': '',
    },
    'xf6ybtb8': {
      'en': '',
      'ar': '',
    },
    'rh7kuduw': {
      'en': '',
      'ar': '',
    },
    'oh8aoq42': {
      'en': '',
      'ar': '',
    },
    'q84dos7d': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
