// import 'package:flutter/material.dart';
// import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
// import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
// import 'package:weather_app/model/weather_model.dart';
// import 'package:weather_app/service/api_service.dart';
// import 'package:weather_app/ui/componts/future_forcast_list.dart';
// import 'package:weather_app/ui/componts/hourly_weather_list.dart';
// import 'package:weather_app/ui/componts/todays_weather.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   ApiService apiService = ApiService();
//   final _textFieldController = TextEditingController();
//   String queryText = "auto:ip";

//   _showTextInputDialog(BuildContext context) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: const Text('Search Location'),
//             content: TextField(
//               controller: _textFieldController,
//               decoration: const InputDecoration(hintText: "search by city,zip"),
//             ),
//             actions: <Widget>[
//               ElevatedButton(
//                 child: const Text("Cancel"),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               ElevatedButton(
//                   child: const Text('OK'),
//                   onPressed: () {
//                     if (_textFieldController.text.isEmpty) {
//                       return;
//                     }
//                     Navigator.pop(context, _textFieldController.text);
//                   }),
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("Flutter Weather App"),
//         actions: [
//           IconButton(
//               onPressed: () async {
//                 _textFieldController.clear();
//                 String text = await _showTextInputDialog(context);
//                 setState(() {
//                   queryText = text;
//                 });
//               },
//               icon: const Icon(Icons.search)),
//           IconButton(
//               onPressed: () {
//                 setState(() {
//                   queryText = "auto:ip";
//                 });
//               },
//               icon: const Icon(Icons.my_location)),
//         ],
//       ),
//       body: SafeArea(
//         child: FutureBuilder(
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               WeatherModel? weatherModel = snapshot.data;
//               return Stack(
//                 children: [
//                   WeatherBg(
//                       weatherType: WeatherType.cloudy,
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           TodaysWeather(weatherModel: weatherModel),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           const Text(
//                             "Weather By Hours",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 2,
//                           ),
//                           SizedBox(
//                             height: 150,
//                             child: ListView.builder(
//                               itemBuilder: (context, index) {
//                                 Hour? hour = weatherModel
//                                     ?.forecast?.forecastday?[0].hour?[index];

//                                 return HourlyWeatherListItem(
//                                   hour: hour,
//                                 );
//                               },
//                               itemCount: weatherModel?.forecast?.forecastday?[0]
//                                       .hour?.length ??
//                                   0,
//                               scrollDirection: Axis.horizontal,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           const Text(
//                             "Next 7 Days Weather",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Expanded(
//                               child: ListView.builder(
//                             itemBuilder: (context, index) {
//                               return FutureForcastListItem(
//                                 forecastday:
//                                     weatherModel?.forecast?.forecastday?[index],
//                               );
//                             },
//                             itemCount:
//                                 weatherModel?.forecast?.forecastday?.length,
//                             scrollDirection: Axis.vertical,
//                             shrinkWrap: true,
//                             padding: EdgeInsets.zero,
//                           ))
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }

//             if (snapshot.hasError) {
//               return const Center(
//                 child: Text("Error Has occcured"),
//               );
//             }

//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//           future: apiService.getWeatherData(queryText),
//         ),
//       ),
//     );
//   }
// }















// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
// import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';

// class Basic extends StatelessWidget {
//   const Basic({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: [
//         WeatherBg(
//             weatherType: WeatherType.cloudy,
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height),
//         SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.2,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.2,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.2,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.2,
//                   height: MediaQuery.of(context).size.height * 0.2,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.2,
//                 ),
//                 Container(
//                   color: const Color.fromARGB(255, 17, 15, 11),
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.2,
//                 ),
//                 Container(
//                   color: Color.fromARGB(255, 60, 162, 67),
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.2,
//                   child: ListView(
//                     scrollDirection: Axis.vertical,
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.2,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         child: Text(
//                           "Salauddin",
//                           style: TextStyle(fontSize: 15, color: Colors.amber),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   color: Color.fromARGB(255, 42, 118, 56),
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.2,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ));
//   }
// }
