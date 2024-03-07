import 'package:fbroadcast/fbroadcast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    if (message.notification != null &&
        message.notification?.title != null &&
        message.notification?.body != null) {}
  } catch (ex) {
    ex.toString();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAPaePPsnCQ_I2MKODe4ofybO_0briJ0X8",
          appId: "1:1009527882445:web:54cbedfa27b82b26825f84",
          databaseURL:
          'https://beyondconsulting-ebbe5-default-rtdb.firebaseio.com',
          messagingSenderId: "1009527882445",
          projectId: 'beyondconsulting-ebbe5'));

  await FlutterFlowTheme.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    localNotify();
    super.initState();

    // getPermission().then((value) {
    //   FirebaseMessaging.instance.getToken().then((fbToken) {
    //     FFAppState().fcm = fbToken ?? 'null';
    //   });
    //   handleInAppMessage();
    // });
    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
  }




  void localNotify() async {
    FirebaseDatabase.instance
        .ref()
        .onChildChanged
        .listen((event) async {
      if (event.snapshot.value != null) {
        Map<Object?, Object?> myValue =
        event.snapshot.value as Map<Object?, Object?>;
        FBroadcast.instance().broadcast('Key_msg',value: myValue);
      };
    });
  }




void handleInAppMessage() {
  FirebaseMessaging.instance.getInitialMessage().then((message) =>
  {
    if (message != null) {_firebaseMessagingInAppHandler(message)}
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    _firebaseMessagingInAppHandler(message);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    _firebaseMessagingInAppHandler(message);
  });
}

Future<void> _firebaseMessagingInAppHandler(RemoteMessage message) async {
  try {
    if (message.notification != null &&
        message.notification?.title != null &&
        message.notification?.body != null &&
        message.from !=
            FirebaseMessaging.instance.app.options.messagingSenderId) {
      showNotification(message.notification);
    }
  } catch (ex) {
    ex.toString();
  }
}

void showNotification(RemoteNotification? notification) async {
  try {
    Fluttertoast.showToast(
        msg: notification?.body ?? '',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.white,
        textColor: Colors.black87);
  } catch (ex) {
    ex.toString();
  }
}

Future<void> getPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

void messageListener(BuildContext context) {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    final notification = message.notification;
    if (notification != null) {
      // showDialog(
      //     context: context,
      //     builder: ((BuildContext context) {
      //       return AlertDialog(
      //           title: Text('${notification.title}'),
      //           content:  Text('${notification.body}'),
      //           actions: <Widget>[
      //             InkWell(
      //               child: Text('Close'),
      //               onTap: () {
      //                 Navigator.of(context).pop();
      //               },
      //             )
      //           ],);
      //     }));
    }
  });
}

void setLocale(String language) {
  setState(() => _locale = createLocale(language));
}

void setThemeMode(ThemeMode mode) =>
    setState(() {
      _themeMode = mode;
      FlutterFlowTheme.saveThemeMode(mode);
    });

@override
Widget build(BuildContext context) {
  return MaterialApp.router(
    title: 'BeyondConsulting',
    localizationsDelegates: const [
      FFLocalizationsDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: _locale,
    supportedLocales: const [
      Locale('en'),
      Locale('ar'),
    ],
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: _themeMode,
    routerConfig: _router,
  );
}}

class DynamicDialog extends StatefulWidget {
  final title;
  final body;

  DynamicDialog({this.title, this.body});

  @override
  _DynamicDialogState createState() => _DynamicDialogState();
}

class _DynamicDialogState extends State<DynamicDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      actions: <Widget>[
        OutlinedButton.icon(
            label: Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close))
      ],
      content: Text(widget.body),
    );
  }
}
