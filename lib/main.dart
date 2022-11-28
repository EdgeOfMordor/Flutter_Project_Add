import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Page 1';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title), backgroundColor: Colors.red),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State {
  TextEditingController nameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  helperText: 'Also u can use email',
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: secondnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Second name',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot name',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
            Container(
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Auth(nameController.text);
                      }));
                    })),
            Row(
              children: [
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20, color: Colors.redAccent),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}

class Auth extends StatelessWidget {
  final String username;
  const Auth(this.username, {super.key});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Page 2'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Container(
          child: Text(
            'name - $username',
            style: const TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        Container(
          width: 110,
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Color(0xFF00FFFF),
                  style: BorderStyle.solid,
                  width: 1.0)),
          alignment: AlignmentDirectional.center,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Назад'),
          ),
        ),
      ])),
    );
  }
}
