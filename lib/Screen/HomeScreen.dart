import 'package:chaquopy/chaquopy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/Snacbar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  
  String _outputOrError = "";

  Map<String, dynamic> data = Map();
  bool loadImageVisibility = true;
  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void addIntendation() {
    TextEditingController _updatedController = TextEditingController();

    int currentPosition = _controller.selection.start;

    String controllerText = _controller.text;
    String text = "${controllerText.substring(0, currentPosition)}    ${controllerText.substring(currentPosition, controllerText.length)}";

    _updatedController.value = TextEditingValue(
      text: text,
      selection: TextSelection(
        baseOffset: _controller.text.length + 4,
        extentOffset: _controller.text.length + 4,
      ),
    );

    setState(() {
      _controller = _updatedController;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 30, 7, 66),
        appBar: AppBar(
          leadingWidth: Get.width,
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(17),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    "Hello PyLearner",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                
                InkWell(
                  child: const Icon(
                    Icons.refresh,
                    size: 30,
                    color: Colors.green,
                  ),
                  onTap: () async {
                    setState(() {
                      _controller.text = "";
                      _outputOrError= "";
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                textAlign: TextAlign.left,
                'Enter The Python Code for execution ',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Courier',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 182, 64),
                ),
              ),
              const SizedBox(height: 10,),
               Expanded(
                flex: 3,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  focusNode: _focusNode,
                  controller: _controller,
                  minLines: 10,
                  maxLines: 20,
                  style: const TextStyle(
                    fontFamily: 'Courier', 
                    fontSize: 14, 
                    color: Colors.greenAccent, 
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black, 
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.grey), 
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                          color: Colors.greenAccent), 
                    ),
                    hintText: 'Enter your command...',
                    hintStyle:
                        const TextStyle(color: Colors.grey), // Hint text color
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black, 
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: Colors.grey), 
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      // _outputOrError,
                       'Output/Error   :\n$_outputOrError',
                      style: TextStyle(
                        fontFamily:
                            'Courier', 
                        fontSize:
                            14,
                        color: _outputOrError.contains('invalid syntax')
                            ? Colors.redAccent
                            : Colors.greenAccent,
                      ),
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.green,
                        onPressed: () => addIntendation(),
                        child: const Icon(
                          Icons.arrow_right_alt,
                          size: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        height: 50,
                        color: Colors.green,
                        child: const Text(
                          'Run Code',
                        ),
                        onPressed: () async {
                          if(_controller.text ==''){
                            Snackbar.snackbar("Empty code", "Please write code to execute");
                          }else{
                            final _result =
                                await Chaquopy.executeCode(_controller.text);
                            if(_result['textOutputOrError']==""){
                              Snackbar.snackbar("Output not printed", "Please use print() method to check output");
                            }
                            setState(() {
                              _outputOrError =
                                  _result['textOutputOrError'] ?? '';
                            });
                          }
                          
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}