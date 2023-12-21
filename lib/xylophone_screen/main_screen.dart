import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class XylophoneScreen extends StatefulWidget {
  const XylophoneScreen({super.key});

  @override
  State<XylophoneScreen> createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  Soundpool pool = Soundpool.fromOptions(options: SoundpoolOptions.kDefault);

  List<int> _soundIds = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    initSoundPool();
  }

  Future<void> initSoundPool() async {
    int soundId = await rootBundle
        .load('assets/do1.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);

    soundId = await rootBundle
        .load('assets/re.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);

    soundId = await rootBundle
        .load('assets/mi.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);

    soundId = await rootBundle
        .load('assets/fa.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);

    soundId = await rootBundle
        .load('assets/sol.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);

    soundId = await rootBundle
        .load('assets/la.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);

    soundId = await rootBundle
        .load('assets/si.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);

    soundId = await rootBundle
        .load('assets/do2.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: gunban('do', Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: gunban('re', Colors.yellow),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: gunban('mi', Colors.green),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: gunban('fa', Colors.blue),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48.0),
                  child: gunban('sol', Colors.deepPurpleAccent),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 56.0),
                  child: gunban('la', Colors.cyan),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64.0),
                  child: gunban('ti', Colors.purpleAccent),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 72.0),
                  child: gunban('ti', Colors.purpleAccent),
                ),
              ],
            ),
    );
  }

  Widget gunban(String text, Color color) {
    return Container(
      width: 50,
      height: double.infinity,
      color: color,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
