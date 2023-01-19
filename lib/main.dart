import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/data/helpers/db_helper.dart';
import 'package:ar_grocery_companion/data/providers/theme_mode_provider.dart';
import 'package:ar_grocery_companion/domain/models/product/product_base.dart';
import 'package:ar_grocery_companion/services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'router.dart';
import 'utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //Background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //Foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Got a message whilst in the foreground");
    print("Message data ${message.data}");
    if (message.notification != null) {
      print("Message also contained a notification: ${message.notification}");
    }
  });

  initConnectionStatus();

  FirebaseHelper db = FirebaseHelper();
  await db.init();
  CategoriesRepository cat = CategoriesRepository.instance;
  CompaniesRepository com = CompaniesRepository.instance;
  cat.update(CustomCategory(
      id: "-NM-IjdokQXGrc_vqnj_", name: "Beverages", products: ['1', '2']));

  com.update(Company(id: "-NLvOZI7U5judTjQBOI4", name: "company3"));
  // cat.delete();
  // com.delete();
  List<CustomCategory> val = await cat.fetchCategoriesList();
  List<Company> val2 = await com.fetchCompaniesList();
  // print(val2);
  // print(val);
  // print(cat.fetchCategoriesList());
  // cat.deleteByName("nae");
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(
    ProviderScope(child: const MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      routerConfig: MyRouter.router,
      debugShowCheckedModeBanner: false,
      themeMode: darkMode,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: kAppPrimaryColor,
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: createMaterialColor(kAppPrimaryColor)),
      ),
      theme: ThemeData(
        primarySwatch: createMaterialColor(kAppPrimaryColor),
      ),
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
