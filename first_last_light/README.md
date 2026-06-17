# First Light & Last Light Card Demo

A simple Flutter app that uses the card widget to display sunlight times for a searched city.

## Widget Presented

The main widget demonstrated in this project is the Flutter card widget.

A card is useful for grouping related information in one clean visual section. In this app, the card groups the city name, first light, sunrise, sunset, and last light.

## Real-World Use Case

This app helps a user quickly view sunlight times for a city.

The user can search:

* Kigali
* Nairobi
* London
* New York
* NYC

After searching, the app displays:

* First Light
* Sunrise
* Sunset
* Last Light

This demo uses fixed sample data to keep the presentation simple and reliable.

## Screenshot

![Final UI](Assets/Screenshot%20(91).png)

## How to Run the App

1. Clone the repository:

git clone https://github.com/mugisha-blaine/firstLight_lastLight.git

2. Open the project folder:

cd firstLight_lastLight

3. Run the app:

flutter run

## Three Card Properties Demonstrated

### 1. margin

margin: const EdgeInsets.all(10),

The margin property controls the space outside the card.

In this app, it gives the card space from the search box and the screen area.

During the demo, I can change it from:

margin: const EdgeInsets.all(10),

to:

margin: const EdgeInsets.all(30),

This will make the card move farther away from surrounding widgets.

A developer adjusts mardgin to improve spacing and make the screen less crowded.

### 2. elevation

elevation: 8,

The elevation property controls the shadow under the card.

A developer adjusts elevation to show importance and separate the card from the background.

### 3. shape

shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(24),
),

The shape property controls the border shape of the card.

In this app, it gives the card rounded corners.

During the demo, I can change it from:


borderRadius: BorderRadius.circular(24),

to:

borderRadius: BorderRadius.circular(5),

This will make the card corners less rounded.

I can also change it to:

borderRadius: BorderRadius.circular(40),

This will make the card corners more rounded.

## Demo Explanation Summary

During the presentation, I will:

1. Run the Flutter app.
2. Search for a city, such as London or New York.
3. Show how the sunlight information appears inside the Card widget.
4. Explain that the Card groups related sunlight information.
5. Demonstrate exactly three Card properties:

   * margin
   * elevation
   * shape

## Main File

The main code is written in:

lib/main.dart

## Notes

This app does not use an API.

The sunlight times are fixed sample values for demo purposes. But I am goint to integrate API soon to make it efficient.

The goal of this project is to demonstrate the Flutter Card widget in a simple real-world scenario.

## Comment

I presented on 17/06/2026.
