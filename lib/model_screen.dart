import 'package:flutter/material.dart';
class InputSaveExample extends StatefulWidget {
  _InputSaveExampleState createState() => _InputSaveExampleState();
  const InputSaveExample({super.key});

  State<InputSaveExample> () => _InputSaveExampleState();
}

class _InputSaveExampleState extends State<InputSaveExample> {
  final List<String> fixedItems = ['',"","","",""];


  List<String> savedItems = [];


  final TextEditingController _controller = TextEditingController();


  void saveItems() {
    setState(() {
      if (_controller.text.isNotEmpty) {

        savedItems.add(_controller.text);
        _controller.clear();
      }
    });
  }
  @override
  void initState() {
    super.initState();
    savedItems.addAll(fixedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter an item',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: saveItems,
              child: Text('Save Items'),
            ),

            SizedBox(height: 30),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.grey[200],
                child: savedItems.isEmpty
                    ? Center(child: Text('No items saved yet.'))
                    : ListView.builder(
                  itemCount: savedItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(savedItems[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
