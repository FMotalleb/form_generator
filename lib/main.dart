import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import 'core/services/state/theme_handler.dart';
import 'features/add_form_page/presentation/pages/add_form_page_view.dart';
import 'get_it_registrant.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: AppBlocObserver(),
  );
}

class AppBlocObserver extends BlocObserver {}

/// {@template app}
/// A [StatelessWidget] that:
/// * uses [bloc](https://pub.dev/packages/bloc) and
/// [flutter_bloc](https://pub.dev/packages/flutter_bloc)
/// to manage the state of a counter and the app theme.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<ThemeCubit>(),
      child: const AppView(),
    );
  }
}

/// {@template app_view}
/// A [StatelessWidget] that:
/// * reacts to state changes in the [ThemeCubit]
/// and updates the theme of the [MaterialApp].
/// * renders the [AddFormPage].
/// {@endtemplate}
class AppView extends StatelessWidget {
  /// {@macro app_view}
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) {
        return ScrollConfiguration(
          behavior: const ScrollBehaviorModified(),
          child: MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', ''),
              const Locale('fa', ''),
            ],
            navigatorKey: GetIt.I.get<GlobalKey<NavigatorState>>(),
            scrollBehavior: const ScrollBehaviorModified(),
            theme: theme,
            home: const AddFormPage(),
          ),
        );
      },
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
    // switch (getPlatform(context)) {
    //   case TargetPlatform.iOS:
    //     return const BouncingScrollPhysics();
    //   case TargetPlatform.macOS:
    //     return const BouncingScrollPhysics();
    //   case TargetPlatform.android:
    //     return const BouncingScrollPhysics();
    //   case TargetPlatform.fuchsia:
    //     return const BouncingScrollPhysics();
    //   case TargetPlatform.linux:
    //     return const BouncingScrollPhysics();
    //   case TargetPlatform.windows:
    //     return const BouncingScrollPhysics();
    // }
  }
}
