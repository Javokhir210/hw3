import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenData extends ChangeNotifier {
  String info = 'This is the first message which is default';

  String get message => info;

  void updateMessage(String newMessage) {
    info = newMessage;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ScreenData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen1(),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 60),
            const SizedBox(height: 6),
            Text('Welcome to Screen 1', style: TextStyle(fontSize: 30)),
            SizedBox(height: 50),
            Text("Text from Screen data class: ",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Consumer<ScreenData>(
              builder: (context, screenData, child) {
                return Text(
                  screenData.message,
                  style: TextStyle(fontSize: 20, color: Colors.green),
                );
              },
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Enter something, but It doesn't change anything",
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Provider.of<ScreenData>(context, listen: false).updateMessage(
                    "This text is stored when the button in page 1 is pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen2()),
                );
              },
              child: Text('Go to Screen 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.queue_play_next, size: 60, color: Colors.orange),
            SizedBox(height: 6),
            Text('Welcome to Screen 2', style: TextStyle(fontSize: 30)),
            Image.asset(
              'lib/images/download.jpg',
              height: 250,
              width: 1000,
            ),
            Text("Text from the previous page: ",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Consumer<ScreenData>(
              builder: (context, screenData, child) {
                return Text(
                  screenData.message,
                  style: TextStyle(fontSize: 20, color: Colors.green),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ScreenData>(context, listen: false).updateMessage(
                        "This text is stored when the button in page 2 is pressed");
                    Navigator.pop(context);
                  },
                  child: Text('Go back to Screen 1'),
                ),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ScreenData>(context, listen: false).updateMessage(
                        'This text is stored when the button in page 2 is pressed');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen3()),
                    );
                  },
                  child: Text('Go to Screen 3'),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Screen 3', style: TextStyle(fontSize: 30)),
            SizedBox(height: 40),
            Image.asset(
              'lib/images/homework.jpg',
              height: 250,
              width: 1100,
            ),
            SizedBox(height: 10),
            Text("Text from the previous page: ",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Consumer<ScreenData>(
              builder: (context, screenData, child) {
                return Text(
                  screenData.message,
                  style: TextStyle(fontSize: 20, color: Colors.green),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add pop method to go back to Screen1
                    Navigator.pop(context);
                  },
                  child: Text('Go back to Screen 2'),
                ),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ScreenData>(context, listen: false)
                        .updateMessage('Message from Screen 3');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen4()),
                    );
                  },
                  child: Text('Go to Screen 4'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen 4')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to Screen 4 which is Math Page',
              style: TextStyle(fontSize: 27)),
          SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.orange,
            width: 250,
            height: 150,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Text(
                    'Calculate: \n\n 230 + 132 = ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Enter your answer",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.green,
            width: 250,
            height: 150,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Text(
                    'Calculate: \n\n 654132 + 125 = ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Enter your answer",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.green,
                width: 250,
                height: 150,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        'Calculate: \n\n 223 + 49848 = ?',
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Enter your answer",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.orange,
                width: 250,
                height: 150,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        'Calculate: \n\n 1528 * 9 = ?',
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Enter your answer",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back to Screen 3'),
              ),
              SizedBox(
                width: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<ScreenData>(context, listen: false)
                      .updateMessage('Message from Screen 4');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen5()),
                  );
                },
                child: Text('Go to Screen 5'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen 5')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Screen 5', style: TextStyle(fontSize: 27)),
            SizedBox(height: 20),
            Container(
              height: 300,
              width: 1000,
              color: Colors.deepOrange,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go back to Screen 4'),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ScreenData>(context, listen: false)
                        .updateMessage('Message from Screen 5');
                  },
                  child: Text('Do Something'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
