import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/message_format.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('es', ''), // Spanish, no country code
        const Locale('fr', ''), // French, no country code
        // add additional locales here
      ],
      title: 'Blackjack',   // TODO: where is this used?
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.lightGreen
      ),
      home: HomeScreen(),
    );
  }
}

/// Main game screen.
class BlackjackGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localStrings = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: Text(localStrings.gameTitle),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
            child: Text(MessageFormat(localStrings.playerBet).format({"bet": "10"}),
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.headline5)));
  }
}

/// Show the rules of the game.
class BlackjackRulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localStrings = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: Text(localStrings.gameRulesLabel),
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(localStrings.gameRulesText,
                    style: Theme.of(context).primaryTextTheme.bodyText1))));
  }
}

/// Settings screen.
class BlackjackSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localStrings = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: Text(localStrings.settingsLabel),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
            child: Text(localStrings.settingsLabel)));
  }
}

/// The app starts at this screen.
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    final localStrings = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(localStrings.gameTitle),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Padding(
              padding: EdgeInsets.all(6.0),
                child: Text(localStrings.gameWelcome,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).primaryTextTheme.headline3)),
            Center(
                heightFactor: 1.5,
                child: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 6.0),
                      child: Text(
                          MessageFormat(localStrings.playerBalance)
                              .format({"balance": "500"}),
                          style: Theme.of(context).primaryTextTheme.headline5)),
                  Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                          MessageFormat(localStrings.numberOfDecks)
                              .format({"decks": "4"}),
                          style: Theme.of(context).primaryTextTheme.headline5)),
                  Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                          MessageFormat(localStrings.shufflePercent)
                              .format({"percent": "50"}),
                          style: Theme.of(context).primaryTextTheme.headline5)),
                  Padding(
                      padding: EdgeInsets.only(top: 6.0),
                      child: Text(
                          MessageFormat(localStrings.dealSpeed)
                              .format({"speed": "2"}),
                          style: Theme.of(context).primaryTextTheme.headline5)),
                ])),
            Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: ElevatedButton(
                    child: Text(localStrings.playGameLabel),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return BlackjackGameScreen();
                        }),
                      );
                    })),
            Padding(
                padding: EdgeInsets.all(6.0),
                child: ElevatedButton(
                    child: Text(localStrings.gameRulesLabel),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return BlackjackRulesScreen();
                        }),
                      );
                    })),
            Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: ElevatedButton(
                    child: Text(localStrings.settingsLabel),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return BlackjackSettingsScreen();
                        }),
                      );
                    })),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
