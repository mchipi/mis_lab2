import 'package:flutter/material.dart';

class SubjectsList extends StatefulWidget {
  @override
  State createState() => _SubjectsListState();
}

class _SubjectsListState extends State<SubjectsList> {
  List<String> subjects = [
    "pantaloni",
    "maica",
    "dukser"
  ];

  final TextEditingController _subjectControllerAdd = TextEditingController();
  final TextEditingController _subjectControllerEdit = TextEditingController();

  void addSubject() {
    String newSubject = _subjectControllerAdd.text;
    if (newSubject.isNotEmpty) {
      setState(() {
        subjects.add(newSubject);
        _subjectControllerAdd.clear();
      });
    }
  }

  void deleteSubject(int index) {
    setState(() {
      subjects.removeAt(index);
    });
  }

  void openEdit(int index) {
  String currentText = subjects[index];
  _subjectControllerEdit.text = currentText;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit Clothing'),
        content: TextField(
          controller: _subjectControllerEdit,
          decoration: InputDecoration(labelText: 'clothing'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Update the subject in the list
              setState(() {
                subjects[index] = _subjectControllerEdit.text;
              });
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(230, 174, 96, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ListTile(
                      title: Text(subjects[index],
                          style: const TextStyle(
                              color: Color.fromRGBO(98, 133, 189, 1),
                              fontWeight: FontWeight.bold)),
                      trailing: Row(
                            mainAxisSize: MainAxisSize.min, // Ensure the buttons take minimum space
                        children: [
                          Container(
                            child: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => openEdit(index),
                              color: Color.fromRGBO(136, 29, 29, 1),
                            ),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(90, 251, 128, 1),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                          ),
                          Container(
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => deleteSubject(index),
                              color: Color.fromRGBO(136, 29, 29, 1),
                            ),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(color: Color.fromRGBO(90, 251, 128, 1),
                            
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _subjectControllerAdd,
                      decoration: const InputDecoration(
                          labelText: 'Enter text',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(202, 210, 197, 1),
                          )),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: addSubject,
                    color: const Color.fromRGBO(202,210,197,1),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(82, 121, 111, 1));
  }
}
