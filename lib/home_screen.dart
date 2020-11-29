import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCountry = "+91";

  TextEditingController _numberController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      minimum: EdgeInsets.all(0),
      child: Scaffold(
        key: _globalKey,
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "🇮🇳🇮🇳🇮🇳 Chat2X 🇮🇳🇮🇳🇮🇳",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Send Messages on WA without saving number.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 30,
                    child: CountryCodePicker(
                      initialSelection: "IN",
                      favorite: ["+91", "IN"],
                      onChanged: (item) {
                        print("county code: " + item.dialCode);
                        setState(() {
                          selectedCountry = item.dialCode;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 70,
                    child: TextField(
                      minLines: 1,
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      maxLength: 15,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Mobile Number",
                          labelText: "Mobile Number"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _messageController,
                minLines: 3,
                maxLines: 1000,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Message",
                    labelText: "Message"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.maxFinite,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    sendMessage();
                  },
                  child: Text(
                    "Send Message",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              Text("Developed in india")
            ],
          ),
        ),
      ),
    );
  }

  void sendMessage() {
    String number, message;

    if (_numberController.text == null || _numberController.text.length < 10) {
      // ignore: deprecated_member_use
      _globalKey.currentState.showSnackBar(SnackBar(content: Text("Enter Valid Mobile Number")));
      return;
    }
    number = selectedCountry + _numberController.text;
    message = _messageController.text;
    String url = "https://wa.me/$number?text=" + Uri.encodeComponent(message);

    _launchURL(url);
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
