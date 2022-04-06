import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translatorapp/services/translate_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                      ),
                      hintText: "Masukan kata"),
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 20,
                ),
                padding: const EdgeInsets.all(2),
                height: 45,
                width: MediaQuery.of(context).size.height,
                child: TextButton(
                  onPressed: () {
                    Future.delayed(Duration(milliseconds: 300))
                        .then((value) async {
                      String message = "in";
                      try {
                        await Provider.of<TranlatorsProviders>(context,
                                listen: false)
                            .translate(_usernameController.text);
                      } catch (e) {
                        print(e);
                      }
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(5),
                    minimumSize:
                        Size.fromWidth(MediaQuery.of(context).size.width / 3),
                    primary: Colors.black,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  child: const Text(
                    'Transalate',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
