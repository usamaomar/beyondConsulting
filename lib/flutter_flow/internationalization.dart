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
    'ra0xsiiu': {
      'en': 'My Priorities',
      'ar': 'أولوياتي',
    },
    'ohwwc2sp': {
      'en': 'Upcoming',
      'ar': 'القادمة',
    },
    'y3hqn22l': {
      'en': 'Overdue',
      'ar': 'متأخرة',
    },
    '5v6lf3da': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'q3lp8obk': {
      'en': ' ',
      'ar': '',
    },
    '6pv65e2v': {
      'en': 'Projects',
      'ar': 'المشاريع',
    },
    'l3ntj3oh': {
      'en': 'See More >>',
      'ar': 'شاهد المزيد >>',
    },
    'a5wbit0k': {
      'en': 'Projects',
      'ar': 'المشاريع',
    },
    'bwv8f0k5': {
      'en': 'See More >>',
      'ar': 'شاهد المزيد >>',
    },
    'zv1tgsjl': {
      'en': 'Targets',
      'ar': 'الأهداف',
    },
    'q87jn3s3': {
      'en': 'Financial Target',
      'ar': 'الهدف المالي',
    },
    'zwtl76zx': {
      'en': 'Client Satisfaction',
      'ar': 'رضا العملاء',
    },
    'bhxknzuf': {
      'en': 'Targets',
      'ar': 'الأهداف',
    },
    'nhgqpzos': {
      'en': 'Financial Target',
      'ar': 'الهدف المالي',
    },
    '1cdtx7kp': {
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
    '8bj5guab': {
      'en': 'Main DashBoard',
      'ar': 'لوحة التحكم الرئيسية',
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
  // ProjectPage
  {
    '72aclu09': {
      'en': 'Projects Tracker',
      'ar': 'متتبع المشاريع',
    },
    'lriocr9t': {
      'en': 'Collaborators',
      'ar': 'المتعاونون',
    },
    'vokc4jta': {
      'en': 'Upcoming Milestones',
      'ar': 'المعالم القادمة',
    },
    'uu017afu': {
      'en': 'Milestone',
      'ar': 'منعطف',
    },
    'k9kpljxf': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'mmrwuywi': {
      'en': 'Deadline',
      'ar': 'موعد التسليم',
    },
    'ab7ejsgk': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '7ogjhx51': {
      'en': 'Financial Outlook',
      'ar': 'التوقعات المالية',
    },
    'hki296sc': {
      'en': 'Total Budgets',
      'ar': 'إجمالي الميزانيات',
    },
    '6g45g0s6': {
      'en': 'Spent Budgets',
      'ar': 'الميزانيات المنفقة',
    },
    '69xkzumz': {
      'en': 'Remaining Budgets',
      'ar': 'الميزانيات المتبقية',
    },
    'ofm4073h': {
      'en': 'Revenue',
      'ar': 'ربح',
    },
    'mhnpt9xj': {
      'en': 'JOD',
      'ar': 'دينار',
    },
    'x8rgmtig': {
      'en': '30k/',
      'ar': 'ربح',
    },
    '239ewb9m': {
      'en': '30k',
      'ar': 'دينار',
    },
    'vi0lsg97': {
      'en': 'Home',
      'ar': '',
    },
  },
  // TeamCapacitiesPage
  {
    '835w2hj5': {
      'en': 'Seniors',
      'ar': 'كبار الاداريين',
    },
    'h8uowkgw': {
      'en': 'Middle Managers',
      'ar': 'مسير وسيط',
    },
    'bqsruo7f': {
      'en': 'Associate',
      'ar': 'مساعدين',
    },
    'i5qzl25v': {
      'en': 'Seniors',
      'ar': 'كبار الاداريين',
    },
    'gqw9wmag': {
      'en': 'Middle Managers',
      'ar': 'مسير وسيط',
    },
    's3iip1dt': {
      'en': 'Associate',
      'ar': 'مساعدين',
    },
    'z0yohwm5': {
      'en': 'Team Capacities',
      'ar': 'قدرات الفريق',
    },
    'waxkqn18': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CostManagement
  {
    's298oagd': {
      'en': 'Collaborators',
      'ar': 'المتعاونون',
    },
    '9932hy4l': {
      'en': 'Client',
      'ar': 'عميل',
    },
    '16m5oc28': {
      'en': 'CollaboratProject Financial Detailsors',
      'ar': 'التفاصيل المالية لمشروع Collaborat',
    },
    'w643ruv4': {
      'en': 'Estimated Cost',
      'ar': 'التكلفة المتوقعة',
    },
    'aoyg0qx6': {
      'en': 'Collaborators',
      'ar': 'المتعاونون',
    },
    'x5ely4t0': {
      'en': 'Gross Profit',
      'ar': 'اجمالي الربح',
    },
    'bgiqcti4': {
      'en': 'Gross Profit Margin',
      'ar': 'هامش الربح الإجمالي',
    },
    '18qqdvdt': {
      'en': 'Collaborators',
      'ar': 'المتعاونون',
    },
    '71093bt5': {
      'en': 'Item',
      'ar': 'غرض',
    },
    'ly1zu7bn': {
      'en': 'Category',
      'ar': 'فئة',
    },
    '4qtx9pn2': {
      'en': 'Cost per Unit (JOD)',
      'ar': 'تكلفة الوحدة (دينار أردني)',
    },
    'uag90mi3': {
      'en': 'Unit',
      'ar': 'وحدة',
    },
    'zdb85tbu': {
      'en': 'Duration',
      'ar': 'مدة',
    },
    'nqugrs9i': {
      'en': 'Duration Unit',
      'ar': 'وحدة المدة',
    },
    'ge0cegel': {
      'en': 'Note',
      'ar': 'ملحوظة',
    },
    'e7u4kwtt': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'hjwlvl4n': {
      'en': 'Collaborators',
      'ar': 'المتعاونون',
    },
    'kdii3s5p': {
      'en': 'Client',
      'ar': 'عميل',
    },
    'lbe0phnu': {
      'en': 'CollaboratProject Financial Detailsors',
      'ar': 'التفاصيل المالية لمشروع Collaborat',
    },
    'd51tj9o4': {
      'en': 'Estimated Cost',
      'ar': 'التكلفة المتوقعة',
    },
    '40l9li6h': {
      'en': 'Collaborators',
      'ar': 'المتعاونون',
    },
    'ec0usot4': {
      'en': 'Gross Profit',
      'ar': 'اجمالي الربح',
    },
    '278fk90p': {
      'en': 'Gross Profit Margin',
      'ar': 'هامش الربح الإجمالي',
    },
    'mrp2gved': {
      'en': 'Collaborators',
      'ar': 'المتعاونون',
    },
    'oshhm79q': {
      'en': 'Item',
      'ar': 'غرض',
    },
    '2he35hvm': {
      'en': 'Category',
      'ar': 'فئة',
    },
    'u9zt9j4c': {
      'en': 'Cost per Unit (JOD)',
      'ar': 'تكلفة الوحدة (دينار أردني)',
    },
    'cckol1qx': {
      'en': 'Unit',
      'ar': 'وحدة',
    },
    'l0jly4l8': {
      'en': 'Note',
      'ar': 'ملحوظة',
    },
    'o3ivf3ho': {
      'en': 'Duration',
      'ar': 'مدة',
    },
    'tnznvsnl': {
      'en': 'Duration Unit',
      'ar': 'وحدة المدة',
    },
    'rhfm6z6m': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'rmel2kpi': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AllTeamCapacitiesPage
  {
    '7j4aa15z': {
      'en': 'Select Team',
      'ar': 'اختر فريق',
    },
    '2679ikqu': {
      'en': 'Seniors',
      'ar': 'كبار الاداريين',
    },
    '84p82kg1': {
      'en': 'Middle Managers',
      'ar': 'مسير وسيط',
    },
    'o1jemtrg': {
      'en': 'Associate',
      'ar': 'مساعدين',
    },
    '4xrxiqlo': {
      'en': 'Team Capacities',
      'ar': 'قدرات الفريق',
    },
    'zthxm6nx': {
      'en': 'Home',
      'ar': '',
    },
  },
  // HomePageSeeAll
  {
    'i9iws4tw': {
      'en': 'Projects',
      'ar': 'المشاريع',
    },
    'qjt01qp3': {
      'en': 'Type of Projects',
      'ar': 'نوع المشاريع',
    },
    'sl19nb58': {
      'en': 'Client',
      'ar': 'عميل',
    },
    'gkxp4m94': {
      'en': 'Original Estimate',
      'ar': 'تقدير الأصلي',
    },
    'qcbtalbt': {
      'en': 'Remaining',
      'ar': 'متبقي',
    },
    'b3yvqi4n': {
      'en': 'Remaining(%)',
      'ar': 'متبقي(٪)',
    },
    'kolof0nk': {
      'en': 'Lead',
      'ar': 'يقود',
    },
    'i6acbjzx': {
      'en': 'Projects',
      'ar': 'المشاريع',
    },
    'nf3anpme': {
      'en': 'Home',
      'ar': '',
    },
  },
  // FinancialPage
  {
    'fzm9nlbq': {
      'en': 'Financial Budget',
      'ar': 'الموازنة المالية',
    },
    'b16czbs9': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'tlbo4blx': {
      'en': 'Category',
      'ar': 'فئة',
    },
    '0bseo92z': {
      'en': 'Percentage',
      'ar': 'نسبة مئوية',
    },
    'osir63vv': {
      'en': 'Annual Amount',
      'ar': 'القيمة السنوية',
    },
    'ggdha5hj': {
      'en': 'Monthly Amount',
      'ar': 'المبلغ الشهري',
    },
    '6tq8uias': {
      'en': 'Download Report',
      'ar': 'تنزيل التقرير',
    },
    'wdxq142a': {
      'en': 'Financial Project Summary',
      'ar': 'ملخص المشروع المالي',
    },
    'jm2q5r4p': {
      'en': 'Client Name',
      'ar': 'اسم العميل',
    },
    '5ar1cv1m': {
      'en': 'Project Name',
      'ar': 'اسم المشروع',
    },
    '05jrgrh4': {
      'en': 'Country',
      'ar': 'دولة',
    },
    'w4spmb0g': {
      'en': 'Revenues',
      'ar': 'الإيرادات',
    },
    'v52eofou': {
      'en': 'Cost Of Sales',
      'ar': 'تكلفة المبيعات',
    },
    'jfdaq7zu': {
      'en': 'Cost Of Sales Percentage',
      'ar': 'النسبة المئوية لتكلفة المبيعات',
    },
    '47a8kuz5': {
      'en': 'Optimal Cost Of Sales',
      'ar': 'التكلفة المثلى للمبيعات',
    },
    'rj3w140m': {
      'en': 'Gross Profit',
      'ar': 'اجمالي الربح',
    },
    'u0aipz83': {
      'en': 'Gross Profit Percentage',
      'ar': 'نسبة إجمالي الربح',
    },
    'qx8695q8': {
      'en': 'Client Satisfaction',
      'ar': 'رضا العملاء',
    },
    'ahjakgux': {
      'en': 'Project Management',
      'ar': 'ادارة مشروع',
    },
    '4607co4d': {
      'en': 'Download Report',
      'ar': 'تنزيل التقرير',
    },
    'ohjad6wp': {
      'en': 'Cost Management Actual Income',
      'ar': 'إدارة التكاليف الدخل الفعلي',
    },
    'urptt7ge': {
      'en': 'Percentage',
      'ar': 'نسبة مئوية',
    },
    '0sbhcthc': {
      'en': 'Annual Amount',
      'ar': 'القيمة السنوية',
    },
    'hdpcp8k4': {
      'en': 'Monthly Amount',
      'ar': 'المبلغ الشهري',
    },
    '34a0ir1k': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'xcesashc': {
      'en': 'Category',
      'ar': 'فئة',
    },
    'gk2c8nlk': {
      'en': 'Up To Date Percentage',
      'ar': 'نسبة محدثة',
    },
    'yhurnlwd': {
      'en': 'Up To Date Annual Amount',
      'ar': 'المبلغ السنوي المحدث',
    },
    'la2r253y': {
      'en': 'Up To Date Monthly Amount',
      'ar': 'ما يصل إلى تاريخ المبلغ الشهري',
    },
    'dyp4qn6y': {
      'en': 'Variance',
      'ar': 'التباين',
    },
    '884ntu0s': {
      'en': 'Variance Percentage',
      'ar': 'نسبة التباين',
    },
    'pj3e3mo7': {
      'en': 'Download Report',
      'ar': 'تنزيل التقرير',
    },
    'less2tef': {
      'en': 'Financial Results',
      'ar': 'النتائج المالية',
    },
    'sq33tzvj': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'khwf0mao': {
      'en': 'Category',
      'ar': 'فئة',
    },
    'vqwz0gb6': {
      'en': 'Percentage',
      'ar': 'نسبة مئوية',
    },
    'f4z49yty': {
      'en': 'Annual Amount',
      'ar': 'القيمة السنوية',
    },
    'k7n1omej': {
      'en': 'Monthly Amount',
      'ar': 'المبلغ الشهري',
    },
    'adc9qw7y': {
      'en': 'Initial Annual Amount',
      'ar': 'المبلغ السنوي الأولي',
    },
    'ebpinxlc': {
      'en': 'Up To Date Percentage',
      'ar': 'نسبة محدثة',
    },
    'r3cw119o': {
      'en': 'Up To Date Annual Amount',
      'ar': 'ما يصل إلى تاريخ المبلغ السنوي',
    },
    'y8dw8aw0': {
      'en': 'Up To Date Monthly Amount',
      'ar': 'ما يصل إلى تاريخ المبلغ الشهري',
    },
    'buqagv4a': {
      'en': 'Variance',
      'ar': 'التباين',
    },
    'j59qaau4': {
      'en': 'Variance Percentage',
      'ar': 'نسبة التباين',
    },
    'flhyevtf': {
      'en': 'Download Report',
      'ar': 'تنزيل التقرير',
    },
    '3y6h8kqm': {
      'en': 'Financials',
      'ar': 'المالية',
    },
    'nzurunjw': {
      'en': '2015',
      'ar': '',
    },
    'nh2h6kal': {
      'en': '2016',
      'ar': '',
    },
    'q7j9xn8x': {
      'en': '2017',
      'ar': '',
    },
    '69u7odmo': {
      'en': '2018',
      'ar': '',
    },
    'c0hkztkb': {
      'en': '2019',
      'ar': '',
    },
    'f0x5vl8i': {
      'en': '2020',
      'ar': '',
    },
    'tag3mc9k': {
      'en': '2021',
      'ar': '',
    },
    '2shja1zg': {
      'en': '2022',
      'ar': '',
    },
    'xelddykb': {
      'en': '2023',
      'ar': '',
    },
    'og39t28a': {
      'en': '2024',
      'ar': '',
    },
    'nvre1u8z': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'w1zpx77f': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UpdateProjectPage
  {
    'fjl6v3if': {
      'en': 'Project Name',
      'ar': 'اسم المشروع',
    },
    'yu3iymed': {
      'en': 'Project Name here...',
      'ar': 'اسم المشروع هنا...',
    },
    'ecxms6gp': {
      'en': 'Country',
      'ar': 'دولة',
    },
    'tz7lyvgq': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    'wcwymv6z': {
      'en': 'End Date',
      'ar': 'تاريخ الانتهاء',
    },
    'b6o1bhc5': {
      'en': 'Project Type',
      'ar': 'نوع المشروع',
    },
    'jqpktlij': {
      'en': 'Project Team',
      'ar': 'فريق المشروع',
    },
    'k6z3t0bd': {
      'en': 'Project Roles',
      'ar': 'أدوار المشروع',
    },
    '2ko1v8fk': {
      'en': 'Status Updates',
      'ar': 'تحديثات الحالة',
    },
    'uddqhthq': {
      'en': 'Project Description',
      'ar': 'وصف المشروع',
    },
    'j28394bp': {
      'en': 'Description  here...',
      'ar': 'الوصف هنا...',
    },
    'qxqjosal': {
      'en': 'Client',
      'ar': 'عميل',
    },
    'w8fcjsdd': {
      'en': 'Project MileStones',
      'ar': 'معالم المشروع',
    },
    'd8dpb810': {
      'en': 'Project Costs',
      'ar': 'تكاليف المشروع',
    },
    '5g9nc3os': {
      'en': 'Add Milestone',
      'ar': 'إضافة معلم',
    },
    '3yzd884d': {
      'en': 'Add Cost',
      'ar': 'أضف التكلفة',
    },
    'e8i8em1l': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'f6gcpenf': {
      'en': 'Update a Project',
      'ar': 'تحديث مشروع',
    },
    '0mq9fyqn': {
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
    'i4cv7m8y': {
      'en': 'Cost Managment',
      'ar': 'إدارة التكاليف',
    },
    'h61xrlo6': {
      'en': 'Create a Project',
      'ar': 'إنشاء مشروع',
    },
    'eq8mamhx': {
      'en': 'Team Capacities',
      'ar': 'قدرات الفريق',
    },
    'o38ukczj': {
      'en': 'Financials',
      'ar': 'المالية',
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
    'v7gokofl': {
      'en': 'Update Milestone',
      'ar': 'تحديث المعلم',
    },
    'f4xpr0qz': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    'y92vn12k': {
      'en': 'End Date',
      'ar': 'تاريخ الانتهاء',
    },
    'ak6fu04d': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '87y130ud': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '8nxu77ww': {
      'en': 'Title here...',
      'ar': 'العنوان هنا...',
    },
    'cithxj3s': {
      'en': 'Cost',
      'ar': 'يكلف',
    },
    'dotfa10f': {
      'en': 'Cost here...',
      'ar': 'التكلفة هنا...',
    },
    've8m7q3v': {
      'en': 'Reminder',
      'ar': 'تذكير',
    },
    'ewqr7uh7': {
      'en': 'Upload Invoice File',
      'ar': 'تحميل ملف الفاتورة',
    },
    'iwcw8i19': {
      'en': 'Update Only',
      'ar': 'التحديث فقط',
    },
  },
  // AddCostDialog
  {
    'c3jdvr1m': {
      'en': 'Add Cost',
      'ar': 'أضف التكلفة',
    },
    'lm3zedn1': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'mxfxb80v': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'zkt22qmr': {
      'en': 'Title here...',
      'ar': 'العنوان هنا...',
    },
    'ee1q6h82': {
      'en': 'Category',
      'ar': 'فئة',
    },
    'pzg19n00': {
      'en': 'Category here...',
      'ar': 'الفئة هنا...',
    },
    'y7cvyqed': {
      'en': 'Cost Perunit',
      'ar': 'التكلفة لكل وحدة',
    },
    'fvukj19a': {
      'en': 'Cost  here...',
      'ar': 'التكلفة هنا...',
    },
    'oj7ajm2a': {
      'en': 'Unit',
      'ar': 'وحدة',
    },
    'hk88b1a6': {
      'en': 'Unit here...',
      'ar': 'الوحدة هنا...',
    },
    'rehbmmzq': {
      'en': 'Duration',
      'ar': 'مدة',
    },
    'ingrrt1r': {
      'en': 'Duration  here...',
      'ar': 'المدة هنا...',
    },
    '889p8aw8': {
      'en': 'Duration Unit',
      'ar': 'وحدة المدة',
    },
    'msv6rvv4': {
      'en': 'Duration Unit here...',
      'ar': 'وحدة المدة هنا...',
    },
    'sllygyce': {
      'en': 'Type of Expenses',
      'ar': 'نوع المصاريف',
    },
    '39ny05o5': {
      'en': 'OPEX',
      'ar': 'النفقات التشغيلية',
    },
    'py3kqgje': {
      'en': 'COGS',
      'ar': 'تكلفة البضائع المباعة',
    },
    'bc0p87c2': {
      'en': 'Please select...',
      'ar': '',
    },
    'rfnvdu3b': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'x3yypxo7': {
      'en': 'Add Only',
      'ar': 'أضف فقط',
    },
  },
  // UpdateCostDialog
  {
    'gfhd1oke': {
      'en': 'Update Cost',
      'ar': 'تحديث التكلفة',
    },
    'kkpkuv1u': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'l9iyzqn3': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    'feayu4ed': {
      'en': 'Title here...',
      'ar': 'العنوان هنا...',
    },
    'bo8web8p': {
      'en': 'Category',
      'ar': 'فئة',
    },
    '9qwk1or7': {
      'en': 'Category here...',
      'ar': 'الفئة هنا...',
    },
    'pnruzvd8': {
      'en': 'Cost Perunit',
      'ar': 'التكلفة لكل وحدة',
    },
    'sl46gav1': {
      'en': 'Cost  here...',
      'ar': 'التكلفة هنا...',
    },
    'k7h0zat4': {
      'en': 'Unit',
      'ar': 'وحدة',
    },
    'bnh2izd2': {
      'en': 'Unit here...',
      'ar': 'الوحدة هنا...',
    },
    'rhlssbwp': {
      'en': 'Duration',
      'ar': 'مدة',
    },
    'k6jacsti': {
      'en': 'Duration  here...',
      'ar': 'المدة هنا...',
    },
    '1mzavyud': {
      'en': 'Duration Unit',
      'ar': 'وحدة المدة',
    },
    'znwwggqf': {
      'en': 'Duration Unit here...',
      'ar': 'وحدة المدة هنا...',
    },
    'xw4rehmu': {
      'en': 'Type of Expenses',
      'ar': 'نوع المصاريف',
    },
    'r4qbnecj': {
      'en': 'OPEX',
      'ar': 'النفقات التشغيلية',
    },
    'kehnlegj': {
      'en': 'COGS',
      'ar': 'تكلفة البضائع المباعة',
    },
    'dk9htpvy': {
      'en': 'Please select...',
      'ar': '',
    },
    '19ra4thg': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '3nm8kibz': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // CostDropComponent
  {
    'dk28h0ck': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'cr6o15rt': {
      'en': 'Approved',
      'ar': 'موافقة',
    },
    '1dk4akoh': {
      'en': 'Rejected',
      'ar': 'مرفوض',
    },
    'yqlvpthd': {
      'en': 'Search for an item...',
      'ar': '',
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
