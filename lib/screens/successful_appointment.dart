import 'package:flutter/material.dart';

class SuccessfulAppointment extends StatefulWidget {
  @override
  _SuccessfulAppointmentState createState() => _SuccessfulAppointmentState();
}

class _SuccessfulAppointmentState extends State<SuccessfulAppointment> {
  int _rating = 0;
  TextEditingController _commentsController = TextEditingController();

  void _submitFeedback() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Feedback Submitted'),
        content: Text('Thank you for your feedback!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text('Okay'),
          ),
        ],
      ),
    );
  }

  Widget _buildStar(int index) {
    IconData icon;
    if (index < _rating) {
      icon = Icons.star;
    } else {
      icon = Icons.star_border;
    }
    return IconButton(
      icon: Icon(icon, color: Colors.amber, size: 36.0),
      onPressed: () {
        setState(() {
          _rating = index + 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5f4ff),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            margin: EdgeInsets.symmetric(horizontal: 32.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('lib/assets/images/success.png', height: 100),
                SizedBox(height: 16.0),
                Text(
                  'Success',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Congratulations, your appointment is confirmed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Divider(),
                SizedBox(height: 16.0),
                Text(
                  'How would you rate your experience at the Fort Deo Animal Clinic?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) => _buildStar(index)),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _commentsController,
                  decoration: InputDecoration(
                    hintText: 'Insert your comments/suggestions here...',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true, // Aligns the label with the hint
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitFeedback,
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
                    backgroundColor: Color(0xffbc1823),
  
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
