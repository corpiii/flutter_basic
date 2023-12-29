import 'package:flutter/material.dart';
import 'package:flutter_basic/main_screen/main_view_model.dart';

class MainScreen extends StatefulWidget {
  MainViewModel viewModel;

  MainScreen({super.key, required this.viewModel});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _time = 0;
  Icon _startButtonIcon = Icon(Icons.play_arrow);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.viewModel.timeStream.listen((data) {
      setState(() {
        _time = data;
      });
    });

    widget.viewModel.isRunningStream.listen((data) {
      setState(() {
        _startButtonIcon = data == true ? Icon(Icons.pause) : Icon(Icons.play_arrow);
      });
    });
  }

  @override
  void dispose() {
    widget.viewModel.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int second = _time ~/ 100;
    int hundredth = _time % 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('스톱워치'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$second',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                '$hundredth'.padLeft(2, '0'),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 200,
            child: StreamBuilder<List<String>>(
              stream: widget.viewModel.lapTimesStream,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container();
                }

                var lapTimes = snapshot.data!;

                return ListView(
                  children: lapTimes.map((e) {
                      return Text(e);
                    }).toList(),
                );
              }
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: widget.viewModel.reset,
                backgroundColor: Colors.orange,
                child: const Icon(Icons.refresh),
              ),
              FloatingActionButton(
                onPressed: widget.viewModel.toggleRunningState,
                child: _startButtonIcon,
              ),
              FloatingActionButton(
                onPressed: () {
                  widget.viewModel.recordLapTime('$second.$hundredth');
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
