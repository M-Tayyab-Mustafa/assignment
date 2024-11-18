import 'firebase_options.dart';
import 'utils/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: CColors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        title: 'Assignment',
        routerConfig: RouterConfiguration.routerConfig,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        builder: (context, child) => LayoutBuilder(builder: (context, constraints) {
          return MediaQuery(data: MediaQuery.of(context).copyWith(size: Size(constraints.maxWidth, constraints.maxHeight)), child: child!);
        }),
      ),
    );
  }
}
