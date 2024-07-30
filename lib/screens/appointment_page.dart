import 'package:flutter/material.dart';
import 'package:innopetcare/screens/custom_app_bar.dart';
import 'package:innopetcare/screens/custom_sub_app_bar.dart';
import 'package:intl/intl.dart';
import 'successful_appointment.dart'; // Import the SuccessfulAppointment screen

class AppointmentPage extends StatefulWidget {
  final String title;
  final String imagepath;

  AppointmentPage({required this.title, required this.imagepath});

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPet = 'Cooper';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _petCondition = '';
  String _additionalInfo = '';
  bool _agreedToTerms = false; // Add a variable to track the checkbox

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSubAppBar(title: 'Appointment for ${widget.title}'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: FractionallySizedBox(
                      widthFactor: 0.75,
                      child:
                          Image.asset('lib/assets/images/${widget.imagepath}')),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Set Appointment',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Type of Service *',
                    border: OutlineInputBorder(),
                  ),
                  enabled: false,
                  initialValue: widget.title,
                  style: const TextStyle(
                      color: Colors.black), // Set the desired color here
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedPet,
                  decoration: const InputDecoration(
                    labelText: 'Select Pet *',
                    border: OutlineInputBorder(),
                  ),
                  items: <String>['Cooper', 'Bella', 'Max', 'Lucy']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedPet = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _selectDateTime(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Date and Time of Preferred Visit *',
                        border: OutlineInputBorder(),
                      ),
                      controller: TextEditingController(
                        text: DateFormat('MMMM d, y hh:mm a').format(DateTime(
                          _selectedDate.year,
                          _selectedDate.month,
                          _selectedDate.day,
                          _selectedTime.hour,
                          _selectedTime.minute,
                        )),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a date and time.';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Please share condition about your pet *',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _petCondition = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please share the condition of your pet.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Additional Information',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _additionalInfo = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                    'By completing and submitting this form you agree to the following Terms & Conditions and carefully read and understand the Shelter\'s Liability Waiver. '),
                Row(
                  children: [
                    Checkbox(
                      value: _agreedToTerms,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _agreedToTerms = newValue!;
                        });
                      },
                    ),
                    const Text('Yes, I agree *')
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() && _agreedToTerms) {
                        // Navigate to SuccessfulAppointment
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuccessfulAppointment(),
                          ),
                        );
                      } else {
                        if (!_agreedToTerms) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                  'Please agree to the terms and conditions.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffbc1823),
                        padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),

                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
