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
    '98mqarv5': {
      'en': 'My Priorities',
      'ar': 'أولوياتي',
    },
    '0ll3yfl3': {
      'en': 'Upcoming',
      'ar': 'القادمة',
    },
    'l4kkia6u': {
      'en': 'Overdue',
      'ar': 'متأخرة',
    },
    '0jmhf24m': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'fdhvt9kh': {
      'en': ' ',
      'ar': '',
    },
    'jheuilak': {
      'en': 'Projects',
      'ar': 'المشاريع',
    },
    'r94z50ch': {
      'en': 'See More >>',
      'ar': 'شاهد المزيد >>',
    },
    'h087oxl9': {
      'en': 'Projects',
      'ar': 'المشاريع',
    },
    'cdqd2nva': {
      'en': 'See More >>',
      'ar': 'شاهد المزيد >>',
    },
    'irpi5f45': {
      'en': 'Targets',
      'ar': 'الأهداف',
    },
    'e3i7s6lq': {
      'en': 'Financial Target',
      'ar': 'الهدف المالي',
    },
    'o6gz17pe': {
      'en': 'Client Satisfaction',
      'ar': 'رضا العملاء',
    },
    '4jec6r2c': {
      'en': 'Targets',
      'ar': 'الأهداف',
    },
    'sl1su7q1': {
      'en': 'Financial Target',
      'ar': 'الهدف المالي',
    },
    '8wy9h4n2': {
      'en': 'Client Satisfaction',
      'ar': 'رضا العملاء',
    },
    '33fu4n6u': {
      'en': 'Home',
      'ar': 'بيت',
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
  // CreateProjectPage
  {
    'yetzisu7': {
      'en': 'Project Name',
      'ar': 'اسم المشروع',
    },
    'zc3vx4b7': {
      'en': 'Project Name here...',
      'ar': 'اسم المشروع هنا...',
    },
    'hxr81z1z': {
      'en': 'Country',
      'ar': 'دولة',
    },
    'vxqutv5s': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    'vmzp7t3l': {
      'en': 'End Date',
      'ar': 'تاريخ الانتهاء',
    },
    '7e3n65l6': {
      'en': 'Project Type',
      'ar': 'نوع المشروع',
    },
    'm82bknwe': {
      'en': 'Project Team',
      'ar': 'فريق المشروع',
    },
    '7rslfzxy': {
      'en': 'Project Roles',
      'ar': 'أدوار المشروع',
    },
    '0ywrkhfu': {
      'en': 'Status Updates',
      'ar': 'تحديثات الحالة',
    },
    'ehgglkkl': {
      'en': 'Project Description',
      'ar': 'وصف المشروع',
    },
    '4f4wu7pt': {
      'en': 'Description  here...',
      'ar': 'الوصف هنا...',
    },
    'ltj8zkqs': {
      'en': 'Client',
      'ar': 'عميل',
    },
    '8bbtfm7u': {
      'en': 'Project MileStones',
      'ar': 'معالم المشروع',
    },
    '694r7i2j': {
      'en': 'Project Costs',
      'ar': 'تكاليف المشروع',
    },
    '7hbe6co6': {
      'en': 'Milestone',
      'ar': '',
    },
    'hp9fsteq': {
      'en': 'Add Milestone',
      'ar': 'إضافة معلم',
    },
    'viq1jpse': {
      'en': 'Add Cost',
      'ar': 'أضف التكلفة',
    },
    'l3au3awf': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'vojhpdrf': {
      'en': 'Create a Project',
      'ar': 'إنشاء مشروع',
    },
    'lxt7h52v': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SideNav
  {
    'zdq4e0la': {
      'en': 'Home',
      'ar': 'بيت',
    },
    'p7ziaqge': {
      'en': 'Main DashBoard',
      'ar': 'لوحة المعلومات الرئيسية',
    },
    '8iucc20h': {
      'en': 'Create a Project',
      'ar': 'إنشاء مشروع',
    },
  },
  // countriesListDialog
  {
    'dmxwgmwz': {
      'en': 'Select Country',
      'ar': 'حدد الدولة',
    },
  },
  // projectTypeListDialog
  {
    'zpdjhv2w': {
      'en': 'Select Country',
      'ar': 'حدد الدولة',
    },
  },
  // personalsTeamListDialog
  {
    '62b9b7qt': {
      'en': 'Select Project Team',
      'ar': 'حدد فريق المشروع',
    },
    '96fq2z21': {
      'en': 'Senior',
      'ar': 'كبير',
    },
    'a5dxvek5': {
      'en': 'Medmanagers',
      'ar': 'مدراء الطب',
    },
    'ibsbdvsu': {
      'en': 'Assosites',
      'ar': 'أسوسيتس',
    },
    'mm1varod': {
      'en': 'Add',
      'ar': 'يضيف',
    },
  },
  // ClintListDialog
  {
    '5tklh7gn': {
      'en': 'Select Client',
      'ar': 'حدد العميل',
    },
  },
  // CreatClientDialog
  {
    'vltr3g3k': {
      'en': 'Create Client',
      'ar': 'إنشاء عميل',
    },
    'b3mc21pu': {
      'en': 'Client Name here...',
      'ar': 'اسم العميل هنا...',
    },
    'd2fs2xrj': {
      'en': 'Email here...',
      'ar': 'البريد الالكتروني هنا...',
    },
    'knw6c9lu': {
      'en': 'Phone Number here...',
      'ar': 'رقم الهاتف هنا...',
    },
    'lu6mbcg4': {
      'en': 'Address here...',
      'ar': 'العنوان هنا...',
    },
    'o4jhbkzy': {
      'en': 'Alternative Phone Number here...',
      'ar': 'رقم الهاتف البديل هنا...',
    },
    'tje6fbcr': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
  },
  // AddMilestoneDialog
  {
    'ptu7uaey': {
      'en': 'Add Milestone',
      'ar': 'إضافة معلم',
    },
    'ji4u2658': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    '08at8l00': {
      'en': 'End Date',
      'ar': 'تاريخ الانتهاء',
    },
    '1ht17vej': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '2tesgtrl': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'kt6wql7g': {
      'en': 'Title here...',
      'ar': 'العنوان هنا...',
    },
    'r68agp4p': {
      'en': 'Cost',
      'ar': 'يكلف',
    },
    'u7cboteo': {
      'en': 'Cost here...',
      'ar': 'التكلفة هنا...',
    },
    'necckuhq': {
      'en': 'Reminder',
      'ar': 'تذكير',
    },
    '47ght3fs': {
      'en': 'Upload Invoice File',
      'ar': 'تحميل ملف الفاتورة',
    },
    'a9ixzmja': {
      'en': 'Add Only',
      'ar': 'أضف فقط',
    },
  },
  // mileStoneStateListDialog
  {
    'dvqpa2xr': {
      'en': 'Select State',
      'ar': 'اختر حالة',
    },
  },
  // remindersMileStoneStateListDialog
  {
    '4sjcvfs0': {
      'en': 'Select Reminders',
      'ar': 'حدد التذكيرات',
    },
  },
  // UpdateMilestoneDialog
  {
    'v3mqiiwf': {
      'en': 'Update Milestone',
      'ar': 'تحديث المعلم',
    },
    'jjwovfh8': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    '8fgym8x2': {
      'en': 'End Date',
      'ar': 'تاريخ الانتهاء',
    },
    'b12tkyg5': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'bihf22yw': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'dbdr07n4': {
      'en': 'Title here...',
      'ar': 'العنوان هنا...',
    },
    'q9gg1544': {
      'en': 'Cost',
      'ar': 'يكلف',
    },
    '8xrziy8p': {
      'en': 'Cost here...',
      'ar': 'التكلفة هنا...',
    },
    '55ya2r1m': {
      'en': 'Reminder',
      'ar': 'تذكير',
    },
    'u3o6lmwc': {
      'en': 'Upload Invoice File',
      'ar': 'تحميل ملف الفاتورة',
    },
    'pm1zom5o': {
      'en': 'Update Only',
      'ar': 'التحديث فقط',
    },
  },
  // Miscellaneous
  {
    'hjb0uoxv': {
      'en': '',
      'ar': '',
    },
    'zdozqsku': {
      'en': '',
      'ar': '',
    },
    'hubdme86': {
      'en': 'We would like to access google callender',
      'ar': '',
    },
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
