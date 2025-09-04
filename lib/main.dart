// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
// import 'package:flutter_soloud/flutter_soloud.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // final player = AudioPlayer();
  late final player = Player();

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    var m = [
      Media(
        'http://m801.music.126.net/20250904230249/838adc0d9947de94f37cccf13fd25761/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/59439727176/5d02/e207/b2d4/fb4cded104bdd20a9673b858dfe5db36.mp3?vuutv=QtdALJtIosCPWON9xZUY3Dj3ukK1J9xGZlI3dv4v5OHGCZ+bNIOF/GCIqJp3IWkyhXwfnHk3MC314/dQJ7GempOL3002eavJ2A2/NnU7ouiiiUVXLoMngPoUMP0G9KNLhWlEusT+GyUyvIy1DgQCh//PtOcWjiA73mrXDyAoRzA=&cdntag=Y2hhbm5lbD1fZGlzdHJpYnV0aW9uJm1hcms9b3Nfd2ViLHF1YWxpdHlfZXhoaWdo',
      ),
    ];
    var x = Playlist(m);
    player.open(x);
    player.play();
    // player.play(
    //   UrlSource(
    //     'https://m801.music.126.net/20250904220134/54cb157aa254c75b60cc33baa24aa7cd/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/59439727176/5d02/e207/b2d4/fb4cded104bdd20a9673b858dfe5db36.mp3?vuutv=5RqmXC3iplLN74qTTt9Nz0lKOw2MnMOKHaUPfWSlWBpD1JGjNOoCfxjanx9/lj5ItEgDjQKW5Yy4kn6cKf/Rq5oPZxNAfY2WjdI8+LOPQFUIKZrj0XXxflXiFFznBSFzamgQyiS59sfXJ8u0mhjHUSEPDXgNPoalPIoZ+6HIJNc=&cdntag=Y2hhbm5lbD1fZGlzdHJpYnV0aW9uJm1hcms9b3Nfd2ViLHF1YWxpdHlfZXhoaWdo',
    //   ),
    // );

    // final soloud = SoLoud.instance;
    // await soloud.init();
    // var source = await soloud.loadUrl(
    //   'http://m801.music.126.net/20250904222806/0ce441f92b1dfb7d4a9c637abd21fb9a/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/59439727176/5d02/e207/b2d4/fb4cded104bdd20a9673b858dfe5db36.mp3?vuutv=Gfr1NQ6U3t78xwaX5WBkUfc+O/fJ+V5Bc2+BxOLK/0qO3okuQHf7qA5jh7tWlUFill9ZSkcppmjhT8nKteunBM+vmC2MS9l1Aj8JvLYyMC8lgkjQu5dmhrgYv7tBCa6bacTIsr9Fcjcj+7ocgKpvORb1ez+b/CRj8BRfPcKNKoY=&cdntag=Y2hhbm5lbD1fZGlzdHJpYnV0aW9uJm1hcms9b3Nfd2ViLHF1YWxpdHlfZXhoaWdo',
    // );
    // soloud.play(source);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
