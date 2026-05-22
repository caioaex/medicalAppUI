import 'package:app01/models/doctor.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final DoctorModel doctorModel;

  const DetailPage({required this.doctorModel, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<CalendarModel> calendarData = [];
  List<TimeModel> timeData = [];
  String horarioSelecionado = "";

  @override
  void initState() {
    super.initState();
    calendarData = widget.doctorModel.calendar;
    timeData = widget.doctorModel.timeAvaliable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 100,
        leadingWidth: 100,
        title: Text("Detail Doctor", style: TextStyle(fontSize: 18)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff050618).withValues(alpha: 0.06),
                  blurRadius: 25,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            info(),
            SizedBox(height: 30),
            calendar(),
            SizedBox(height: 30),
            timeAppointment(),
            SizedBox(height: 190),
            bookAppointment(),
          ],
        ),
      ),
    );
  }

  Widget info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Container(
                width: 105,
                decoration: BoxDecoration(
                  color: widget.doctorModel.imageBox,
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage(widget.doctorModel.image),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctorModel.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.doctorModel.specialties.first,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 5),
                        Text(
                          widget.doctorModel.score.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Biography",
          style: TextStyle(
            color: Color(0xff09121C),
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 10),
        Text(
          widget.doctorModel.bio,
          style: TextStyle(
            color: Color(0xff09121C).withValues(alpha: 0.5),
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Specialities",
          style: TextStyle(
            color: Color(0xff09121C),
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Text(
                widget.doctorModel.specialties[index],
                style: TextStyle(
                  color: Color(0xff09121C),
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 20),
            itemCount: widget.doctorModel.specialties.length,
          ),
        ),
      ],
    );
  }

  Widget calendar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Calendar",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  for (var item in calendarData) {
                    item.isSelected = false;
                  }
                  calendarData[index].isSelected = true;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: calendarData[index].isSelected
                        ? Color(0xff51A8FF)
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 25,
                        color: Color(0xff050618).withValues(alpha: 0.05),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        calendarData[index].dayNumber.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        calendarData[index].dayName.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: calendarData.length,
          ),
        ),
      ],
    );
  }

  Widget timeAppointment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Time",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 35,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  for (var item in timeData) {
                    item.isSelected = false;
                  }
                  timeData[index].isSelected = true;
                  horarioSelecionado = timeData[index].time;
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(90)),
                    color: timeData[index].isSelected
                        ? Color(0xff51A8FF)
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 25,
                        color: Color(0xff050618).withValues(alpha: 0.1),
                      ),
                    ],
                  ),
                  child: Text(
                    timeData[index].time + " " + timeData[index].period,
                    style: TextStyle(
                      color: timeData[index].isSelected
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 30),
            itemCount: timeData.length,
          ),
        ),
      ],
    );
  }

  Widget bookAppointment() {
    return GestureDetector(
      onTap: () async {
        final confirmou = await _showConfirmationDialog(
          context,
          horarioSelecionado,
        );

        if (confirmou == true) {
          if (!mounted) return;
          Navigator.pop(context);
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(90)),
          color: Color(0xff51A8FF),
        ),
        child: Text(
          "Book Appointment",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context, String horario) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar agendamento'),
        content: Text('Deseja marcar a consulta no horário $horario?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}
