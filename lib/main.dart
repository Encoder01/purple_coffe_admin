import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:untitled/Screens/appenv/presentation/manager/appenv_bloc.dart';
import 'package:untitled/Screens/dashboard/presentation/manager/user_fortune_bloc.dart';
import 'package:untitled/config/themes/themes.dart';
import 'package:untitled/injection_container.dart';
import 'Screens/appenv/presentation/pages/app_env_page.dart';
import 'Screens/dashboard/presentation/manager/fortune_bloc.dart';
import 'Screens/dashboard/presentation/pages/fortune_tells_page.dart';
import 'Screens/users/presentation/manager/user_bloc.dart';
import 'Screens/users/presentation/pages/users_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FortuneBloc(
            serviceLocator(),
            serviceLocator(),
          )..add(GetMyFortunes()),
        ),
        BlocProvider(
          create: (context) => UserBloc(
            serviceLocator(),
          )..add(GetUserEvent()),
        ),
        BlocProvider(
          create: (context) => UserFortuneBloc(
            serviceLocator(),
          ),
        ),
        BlocProvider(
          create: (context) => AppEnvBloc(
            serviceLocator(),
            serviceLocator(),
          )..add(GetAppEnvEvent()),
        )
      ],
      child: MaterialApp(
        theme: Themes.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const Dashboard(),
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  onTapBottom(int index) {
    setState(() {
      currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Themes.gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Offstage(
                offstage: currentIndex != 0,
                child: FortuneTellsPage(
                  onTap: onTapBottom,
                )),
            Offstage(
              offstage: currentIndex != 1,
              child: ProfilePage(),
            ),
            Offstage(
              offstage: currentIndex != 2,
              child: AppEnvPage(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Themes.gradientColors.last,
        onTap: onTapBottom,
        currentIndex: currentIndex,
        selectedItemColor: Themes.mainColor,
        unselectedItemColor: Themes.subColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Fallar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_sharp),
              label: "Kullanıcılar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration), label: "Uygulama Ayarı"),
        ],
      ),
    );
  }
}
