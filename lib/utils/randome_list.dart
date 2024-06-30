import 'dart:math';

List timeStore=[
  '33 min • 7 km',
  '45min • 13 km',
  '40 min • 12 km',
  '10 min • 4 km',
  '19 min • 2 km',
  '36 min • 10 km',
  '25 min • 6 km',
  '60 min • 15 km',
  '20 min • 2 km',
];
Random randomTimeStoreIndex=Random();
Random randomDurationAreaIndex=Random();
int indexTime=0;
int indexDescriptions=0;
int indexTime2=0;
List durationArea=[
  'North Indian',
  'South Indian',
  'Wast Indian',
  'State',
];
List descriptionsList=[
  'Food is one of the basic necessities of life. Food contains nutrients—substances essential for the growth, repair, and maintenance of body tissues and for the regulation of vital processes.',
  "Nutrients provide the energy our bodies need to function. The energy in food is measured in units called calories.",
  "Typically, the term food quality represents the sum of all properties and attributes of a food item that are acceptable to the customer",
  "These food quality attributes include: Appearance (including size, shape, colour, gloss and consistency) Texture.",
  "substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy",
  "one that has been produced under sanitary conditions, with the right ingredients, and with minimal processing",
  "Food is any substance consumed to provide nutritional support and energy to an organism",
];