import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import 'package:workmanager/workmanager.dart';

/// Used for Background Updates using Workmanager Plugin
void callbackDispatcher() async {
  Workmanager().executeTask((taskName, inputData) {
    final now = DateTime.now();
    return Future.wait<bool?>([
      HomeWidget.saveWidgetData(
        'title',
        'Updated from Background',
      ),
      HomeWidget.saveWidgetData(
        'message',
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
      ),
      HomeWidget.updateWidget(
        name: 'HomeWidgetExampleProvider',
        iOSName: 'HomeWidgetExample',
      ),
    ]).then((value) {
      return !value.contains(false);
    });
  });
}

/// Called when Doing Background Work initiated from Widget
void backgroundCallback(Uri? data) async {
  print(data);

  if (data!.host == 'titleclicked') {
    final greetings = [
      'Hello',
      'Hallo',
      'Bonjour',
      'Hola',
      'Ciao',
      '哈洛',
      '안녕하세요',
      'xin chào'
    ];
    final selectedGreeting = greetings[Random().nextInt(greetings.length)];

    await HomeWidget.saveWidgetData<String>('title', selectedGreeting);
    await HomeWidget.updateWidget(
        name: 'HomeWidgetExampleProvider', iOSName: 'HomeWidgetExample');
  }
}

class RemoteWidget extends StatefulWidget {
  const RemoteWidget({Key? key}) : super(key: key);

  @override
  _RemoteWidgetState createState() => _RemoteWidgetState();
}

class _RemoteWidgetState extends State<RemoteWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    HomeWidget.setAppGroupId('YOUR_GROUP_ID');
    HomeWidget.registerBackgroundCallback(backgroundCallback);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkForWidgetLaunch();
    HomeWidget.widgetClicked.listen(_launchedFromWidget);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<Future<List<bool?>>?> _sendData() async {
    try {
      return Future.wait([
        HomeWidget.saveWidgetData<String>('title', _titleController.text),
        HomeWidget.saveWidgetData<String>('message', _messageController.text),
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Sending Data. $exception');
    }
    return null;
  }

  Future<Future<bool?>?> _updateWidget() async {
    try {
      return HomeWidget.updateWidget(
          name: 'HomeWidgetExampleProvider', iOSName: 'HomeWidgetExample');
    } on PlatformException catch (exception) {
      debugPrint('Error Updating Widget. $exception');
    }
    return null;
  }

  Future<Future<List<String?>>?> _loadData() async {
    try {
      return Future.wait([
        HomeWidget.getWidgetData<String>('title', defaultValue: 'Default Title')
            .then((value) => _titleController.text = value!),
        HomeWidget.getWidgetData<String>('message',
                defaultValue: 'Default Message')
            .then((value) => _messageController.text = value!),
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Getting Data. $exception');
    }
    return null;
  }

  Future<void> _sendAndUpdate() async {
    await _sendData();
    await _updateWidget();
  }

  void _checkForWidgetLaunch() {
    HomeWidget.initiallyLaunchedFromHomeWidget().then(_launchedFromWidget);
  }

  void _launchedFromWidget(Uri? uri) {
    showDialog(
      context: context,
      builder: (buildContext) => AlertDialog(
        title: const Text('App started from HomeScreenWidget'),
        content: Text('Here is the URI: $uri'),
      ),
    );
  }

  void _startBackgroundUpdate() {
    Workmanager().registerPeriodicTask(
      '1',
      'widgetBackgroundUpdate',
      frequency: const Duration(minutes: 15),
    );
  }

  void _stopBackgroundUpdate() {
    Workmanager().cancelByUniqueName('1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeWidget Example'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
              controller: _titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Body',
              ),
              controller: _messageController,
            ),
            ElevatedButton(
              onPressed: _sendAndUpdate,
              child: const Text('Send Data to Widget'),
            ),
            ElevatedButton(
              onPressed: _loadData,
              child: const Text('Load Data'),
            ),
            ElevatedButton(
              onPressed: _checkForWidgetLaunch,
              child: const Text('Check For Widget Launch'),
            ),
            if (Platform.isAndroid)
              ElevatedButton(
                onPressed: _startBackgroundUpdate,
                child: const Text('Update in background'),
              ),
            if (Platform.isAndroid)
              ElevatedButton(
                onPressed: _stopBackgroundUpdate,
                child: const Text('Stop updating in background'),
              )
          ],
        ),
      ),
    );
  }
}
