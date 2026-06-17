import 'package:flutter/material.dart';

void main() {
  runApp(const SunlightApp());
}

// Main app widget
class SunlightApp extends StatelessWidget {
  const SunlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Removes the red debug banner
      debugShowCheckedModeBanner: false,

      title: 'Sunlight Card App',

      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.lightBlue),

      home: const HomePage(),
    );
  }
}

// We use StatefulWidget because city data will change after searching.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// This class stores the changing data of the page.
class _HomePageState extends State<HomePage> {
  // This controller helps us get what the user types.
  final TextEditingController cityController = TextEditingController();

  // Default city data shown when the app opens.
  String cityName = 'Kigali';
  String firstLight = '5:25 AM';
  String sunrise = '5:45 AM';
  String sunset = '6:08 PM';
  String lastLight = '6:28 PM';

  // This message appears when the city is not found.
  String errorMessage = '';

  // This function runs when the user searches for a city.
  void searchCity() {
    String typedCity = cityController.text.trim().toLowerCase();

    setState(() {
      errorMessage = '';

      if (typedCity == 'kigali') {
        cityName = 'Kigali';
        firstLight = '5:25 AM';
        sunrise = '5:45 AM';
        sunset = '6:08 PM';
        lastLight = '6:28 PM';
      } else if (typedCity == 'nairobi') {
        cityName = 'Nairobi';
        firstLight = '5:40 AM';
        sunrise = '6:00 AM';
        sunset = '6:30 PM';
        lastLight = '6:50 PM';
      } else if (typedCity == 'london') {
        cityName = 'London';
        firstLight = '4:20 AM';
        sunrise = '4:43 AM';
        sunset = '9:20 PM';
        lastLight = '9:43 PM';
      } else if (typedCity == 'new york' || typedCity == 'nyc') {
        cityName = 'New York';
        firstLight = '5:05 AM';
        sunrise = '5:25 AM';
        sunset = '8:30 PM';
        lastLight = '8:50 PM';
      } else {
        errorMessage =
            'City not found. Try Kigali, Nairobi, London, or New York.';
      }
    });
  }

  @override
  void dispose() {
    // This cleans the controller when the page is closed.
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Light & Last Light'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade300,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Sky-like background using gradient colors
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4FC3F7), // sky blue
              Color(0xFF81D4FA), // soft blue
              Color(0xFFE1F5FE), // very light blue
            ],
          ),
        ),

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [
                const SizedBox(height: 20),

                // Icon to show the app is related to sky/weather
                const Icon(Icons.cloud, size: 80, color: Colors.white),

                const SizedBox(height: 20),

                const Text(
                  'Search a city to see sunlight times',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'First light • Sunrise • Sunset • Last light',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),

                const SizedBox(height: 25),

                // Search box
                TextField(
                  controller: cityController,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    labelText: 'Search city',
                    hintText: 'Example: London',

                    prefixIcon: const Icon(Icons.location_city),

                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: searchCity,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  // Allows user to press Enter to search
                  onSubmitted: (value) {
                    searchCity();
                  },
                ),

                const SizedBox(height: 12),

                // Error message appears only when city is not found
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                const SizedBox(height: 20),

                // Temporary text to show that search logic works.
                // We will replace this with a Card widget in Part 4.
                Text(
                  'Selected city: $cityName',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
