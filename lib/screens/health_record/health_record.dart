import 'package:flutter/material.dart';

class PetHealthRecord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Health Record'),
        backgroundColor: Color(0xFF094886),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Pet Health Record',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF094886),
                ),
              ),
              SizedBox(height: 16),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('lib/assets/images/dog-cooper.png'),
              ),
              SizedBox(height: 16),
              Text(
                'Pet Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Cooper',
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
              Text(
                'Pet Record No. 0034',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pet Information',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Divider(color: Colors.black),
                          Text('Age: 1'),
                          Text('Birth Date: 12/18/2022'),
                          Text('Species: Dog'),
                          Text('Breed: Corgi'),
                          Text('Gender: Male'),
                          Text('Weight: 11.5 kg'),
                          Text('Color: Fawn'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Health Concerns',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Divider(color: Colors.black),
                          Text('Allergies: None'),
                          Text('Existing Conditions: None'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Description')),
                    DataColumn(label: Text('Diagnosis')),
                    DataColumn(label: Text('Test Results')),
                    DataColumn(label: Text('Prescribed Medication')),
                    DataColumn(label: Text('Prescribed Action')),
                    DataColumn(label: Text('Veterinarian')),
                    DataColumn(label: Text('Notes')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('07/25/2023')),
                      DataCell(Text('Routine Checkup')),
                      DataCell(Text('Healthy')),
                      DataCell(Text('-')),
                      DataCell(Text('-')),
                      DataCell(Text('-')),
                      DataCell(Text('Dr. Smith')),
                      DataCell(Text('-')),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}