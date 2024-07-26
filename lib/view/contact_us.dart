import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_web_responsive/constants.dart';
import 'package:flutter_map/flutter_map.dart' as flutterMap;
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latLng;

final List<latLng.LatLng> locations = [
  latLng.LatLng(16.77679310121505, 96.228678157696) // Yangon, Kamayut Township
];

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Row(
      children: [
        myDrawer,
        Expanded(child: _container()),
        Expanded(child: _contactAndMap())
      ],
    );
  }

  Widget _container() {
    return Container(
      color: const Color.fromARGB(255, 46, 46, 46),
      child: Stack(
        children: <Widget>[
          // Background image with opacity
          Opacity(
            opacity: 0.5, // Adjust the opacity as needed
            child: Image.network(
              'https://images.pexels.com/photos/3878733/pexels-photo-3878733.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', // Replace with your image URL
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Text on top of the background image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 100),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _contactInfo(
                    "Address",
                    Icons.location_pin,
                    "Yangon, Kamayut Township",
                  ),
                  _contactInfo(
                    "Let's Talk",
                    Icons.phone,
                    "+959890630456",
                  ),
                  _contactInfo(
                    "Mail",
                    Icons.mail,
                    "homehaven.mm.com",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactInfo(String name, IconData icon, String info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 26,
              color: Colors.white,
            ),
            Margin(width: 10, height: 0),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
        Text(
          info,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        )
      ],
    );
  }

  Widget _contactAndMap() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Margin(width: 0, height: 30),
        Text(
          "Contact Us",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Expanded(child: _contactGroup(Colors.black)),
        _location(),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Container(
            width: double.infinity,
            height: 250,
            child: CommonMapWidget(
                widthFactor: 0.3,
                initialCenter:
                    latLng.LatLng(16.77679310121505, 96.228678157696),
                initialZoom: 14,
                markerPoints: locations),
          ),
        ),
      ],
    );
  }

  Widget _location() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_pin,
          color: Colors.blueAccent,
          size: 30,
        ),
        Margin(width: 10, height: 0),
        Text(
          "Our Location",
          style: TextStyle(
              fontSize: 20,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _contactGroup(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Column(
              children: [
                CustomInputField(formName: "Name", icon: Icons.person),
                Margin(width: 0, height: 15),
                CustomInputField(formName: "Email", icon: Icons.mail),
                Margin(width: 0, height: 15),
                CustomInputField(formName: "Phone", icon: Icons.phone),
                Margin(width: 0, height: 15),
                CustomInputField(formName: "Subject", icon: Icons.subject),
                Margin(width: 0, height: 15),
                _textArea("Message", Icons.message),
                _buttonGroup()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textArea(String formName, IconData icon) {
    return Stack(
      children: [
        TextField(
          maxLength: 20,
          maxLines: 3,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: formName,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.008,
              ),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color.fromARGB(255, 0, 140, 255).withOpacity(0.2),
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
          ),
        ),
        Positioned(
          top: 17,
          left: 8,
          child: Icon(
            icon,
            color: Color.fromARGB(255, 79, 79, 79),
          ),
        ),
      ],
    );
  }

  Widget _buttonGroup() {
    return Row(
      children: [
        Expanded(child: _sendMessage()),
        Expanded(child: _contactNow(Icons.phone)),
      ],
    );
  }

  Widget _contactNow(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          // FlutterPhoneDirectCaller.callNumber("+959890630456");
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              MediaQuery.sizeOf(context).width * 0.008,
            ),
          ),
          side: const BorderSide(
              color: Color.fromARGB(114, 33, 149, 243), width: 1),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              size: 30,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Contact Now",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sendMessage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Get.offAllNamed('/detail');
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              MediaQuery.sizeOf(context).width * 0.008,
            ),
          ),
          backgroundColor: Colors.blue[400],
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.message,
              size: 30,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Send Message",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
