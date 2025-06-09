import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queenbee/layers/data/character_repository_impl.dart';
import 'package:queenbee/layers/data/source/api.dart';
import 'package:queenbee/layers/data/source/local/local_storage.dart';
import 'package:queenbee/layers/domain/usecase/get_all_characters.dart';
import 'package:queenbee/layers/presentation/auth/login_page/login_page.dart';
import 'package:queenbee/layers/presentation/character/list_page/view/character_page.dart';
import 'package:queenbee/layers/presentation/theme.dart';
import 'package:queenbee/main.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late GetAllCharacters _getAllCharacters;
  var themeMode = ThemeMode.dark;

  @override
  void initState() {
    super.initState();
    final api = ApiImpl();
    final localStorage = LocalStorageImpl(sharedPreferences: sharedPref);
    final repo = CharacterRepositoryImpl(api: api, localStorage: localStorage);
    _getAllCharacters = GetAllCharacters(repository: repo);
  }

  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();
    return MaterialApp(
      themeMode: themeMode,
      theme: theme.toThemeData(),
      darkTheme: theme.toThemeDataDark(),
      home: Scaffold(
        body: MultiProvider(
        providers: [
          Provider.value(value: _getAllCharacters),
        ],
        child: LoginPage(),
      ),
      ),
    );
  }
}