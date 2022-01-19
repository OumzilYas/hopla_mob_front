import 'package:flutter/material.dart';

class Scooter {
  final String name;
  final String imageURL;
  final int maxSpeed;
  final int range;
  final Color color;

  Scooter({
    required this.name,
    required this.imageURL,
    required this.maxSpeed,
    required this.range,
    required this.color,
  });
}

List<Scooter> scooterData = [
  Scooter(
    name: 'Bgauss DCF-07',
    imageURL: 'assets/e_scooter.png',
    maxSpeed: 135,
    range: 200,
    color: Color(0xffF3F0D7),
  ),
  Scooter(
    name: 'Bgauss RD-567',
    imageURL: 'assets/e_scooter.png',
    maxSpeed: 135,
    range: 200,
    color: Color(0xffFFBF86),
  ),
  Scooter(
    name: 'Bgauss DCF-07',
    imageURL: 'assets/e_scooter.png',
    maxSpeed: 135,
    range: 200,
    color: Color(0xffF3F0D7),
  ),
  Scooter(
    name: 'Uno Scooter',
    imageURL: 'assets/e_scooter.png',
    maxSpeed: 135,
    range: 200,
    color: Color(0xffFFBF86),
  ),
];
