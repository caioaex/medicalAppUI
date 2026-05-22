import 'package:flutter/material.dart';

class DoctorModel {
  String name;
  String image;
  Color imageBox;
  List<String> specialties;
  double score;
  String bio;
  List<CalendarModel> calendar;
  List<TimeModel> timeAvaliable;

  DoctorModel({
    required this.name,
    required this.image,
    required this.imageBox,
    required this.specialties,
    required this.score,
    required this.bio,
    required this.calendar,
    required this.timeAvaliable,
  });

  static List<DoctorModel> getDoctors() {
    List<DoctorModel> doctors = [];

    doctors.add(
      DoctorModel(
        name: "Dr. Jenny Wilson",
        image: "assets/images/jenny.png",
        imageBox: const Color(0xffFFA340).withValues(alpha: 0.75),
        specialties: ['Dental Surgeon', 'Aesthetic Surgeon', 'General Dentist'],
        score: 4.8,
        bio:
            "Dr. Jenny Wilson (Implantologist), is a Dentist in America, she has 20 years of experience",
        calendar: [
          CalendarModel(dayNumber: 14, dayName: 'Sun'),
          CalendarModel(dayNumber: 15, dayName: 'Mon'),
          CalendarModel(dayNumber: 16, dayName: 'Tue'),
          CalendarModel(dayNumber: 17, dayName: 'Wed'),
        ],
        timeAvaliable: [
          TimeModel(time: "09:00", period: "AM"),
          TimeModel(time: "11:00", period: "AM"),
          TimeModel(time: "03:00", period: "PM"),
        ],
      ),
    );

    doctors.add(
      DoctorModel(
        name: "Dr. Kristin Watson",
        image: "assets/images/kristin.png",
        imageBox: const Color(0xff3CFFC4),
        specialties: ['Dental Surgeon', 'Aesthetic Surgeon', 'General Dentist'],
        score: 4.8,
        bio:
            "Dr. Jenny Wilson (Implantologist), is a Dentist in America, she has 20 years of experience",
        calendar: [
          CalendarModel(dayNumber: 14, dayName: 'Sun'),
          CalendarModel(dayNumber: 15, dayName: 'Mon'),
          CalendarModel(dayNumber: 16, dayName: 'Tue'),
          CalendarModel(dayNumber: 17, dayName: 'Wed'),
        ],
        timeAvaliable: [
          TimeModel(time: "09:00", period: "AM"),
          TimeModel(time: "11:00", period: "AM"),
          TimeModel(time: "03:00", period: "PM"),
        ],
      ),
    );

    return doctors;
  }
}

class CalendarModel {
  final int dayNumber;
  final String dayName;
  bool isSelected;

  CalendarModel({
    required this.dayNumber,
    required this.dayName,
    this.isSelected = false,
  });
}

class TimeModel {
  final String time;
  final String period;
  bool isSelected;

  TimeModel({
    required this.time,
    required this.period,
    this.isSelected = false,
  });
}
