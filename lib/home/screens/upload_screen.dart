import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kpostal/kpostal.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:numberpicker/numberpicker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String currentAddress = "장소를 입력해 주세요";
  DateTime? _selectedDate;
  XFile? _pickedFile;
  List<String> values = [];
  int _currentnumofmembers = 0;

  void onDelete(int idx) {
    setState(() {
      values.removeAt(idx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          "파티 만들기",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 이미지 선택

              _pickedFile == null
                  ? Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: InkWell(
                          onTap: () {
                            _showBottomSheet();
                          },
                          child: const Center(
                            child: Icon(
                              Icons.add_a_photo,
                            ),
                          )))
                  : Container(
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.withOpacity(0.2),
                          image: DecorationImage(
                              image: FileImage(File(_pickedFile!.path)),
                              fit: BoxFit.cover)),
                    ),
              const SizedBox(
                height: 20,
              ),
              //파티 이름
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '퀘스트',
                ),
              ),
              const SizedBox(
                height: 20,
              ), //인원 수
              Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                      onTap: () => _showIntegerDialog(),
                      child: Text("$_currentnumofmembers명"))),
              //장소 설정
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => KpostalView(
                            callback: (result) {
                              setState(() {
                                currentAddress = result.address;
                              });

                              print(result.latitude);
                              print(result.longitude);
                            },
                          )),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(currentAddress),
                  ),
                ),
              ),
              //파티 날짜
              Row(children: [
                DateTimePicker()
                //   TextButton(
                //       onPressed: () {
                //         DatePicker.showDatePicker(context,
                //             showTitleActions: true,
                //             minTime: DateTime.now(),
                //             maxTime: DateTime(2023, 12, 31), onChanged: (date) {
                //           print('change $date');
                //         }, onConfirm: (date) {
                //           setState(() {
                //             _selectedDate = date;
                //           });
                //         }, currentTime: DateTime.now(), locale: LocaleType.ko);
                //       },
                //       child: _selectedDate == null
                //           ? const Text(
                //               '시간을 정해주세요',
                //               style: TextStyle(color: Colors.black),
                //             )
                //           : Text("$_selectedDate",
                //               style: const TextStyle(color: Colors.black)))
                // ]),
              ]),
              const SizedBox(
                height: 20,
              ),

              Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TagEditor(
                      length: values.length,
                      delimiters: const [',', ' '],
                      hasAddButton: true,
                      inputDecoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '#해시태그',
                      ),
                      onTagChanged: (newValue) {
                        setState(() {
                          values.add(newValue);
                        });
                      },
                      tagBuilder: (context, index) => _Chip(
                        index: index,
                        label: values[index],
                        onDeleted: onDelete,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              //파티 설명

              const TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '파티 설명',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () => {},
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.blueAccent,
                        Colors.greenAccent,
                      ],
                    ),
                  ),
                  child: const Text(
                    '만들기',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey),
                  ),
                ),
              ),
              const Text("TODO : 날짜, 장소")
            ],
          ),
        ),
      ),
    );
  }

  Future _showIntegerDialog() async {
    await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatefulBuilder(builder: (context, sbsetState) {
                  return NumberPicker(
                      minValue: 0,
                      maxValue: 30,
                      step: 1,
                      value: _currentnumofmembers,
                      onChanged: (value) {
                        setState(() {
                          _currentnumofmembers = value;
                        });
                        sbsetState(() {
                          _currentnumofmembers = value;
                        });
                      });
                }

                    //TODO 변수하나 더 둬서 취소 버튼추가하기

                    ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "확인",
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
          );
        });
  }

  _showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () =>
                  {Navigator.pop(context), _getPhotoLibraryImage()},
              child: const Text(
                '앨범에서 사진 선택',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }

  _getPhotoLibraryImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    } else {
      _pickedFile = null;
    }
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  String _date = "날짜를 정해주세요";
  String _starttime = "시간을 정해주세요";
  String _endtime = "시간을 정해주세요";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlinedButton(
          onPressed: () {
            DatePicker.showDatePicker(context,
                theme: const DatePickerTheme(
                  containerHeight: 210.0,
                ),
                showTitleActions: true,
                minTime: DateTime.now(),
                maxTime: DateTime(2023, 12, 31), onConfirm: (date) {
              print('confirm $date');
              _date = '${date.year} - ${date.month} - ${date.day}';
              setState(() {});
            }, currentTime: DateTime.now(), locale: LocaleType.ko);
          },
          child: Container(
            alignment: Alignment.center,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.date_range,
                            size: 18.0,
                            color: Colors.black,
                          ),
                          Text(
                            " $_date",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        OutlinedButton(
          onPressed: () {
            DatePicker.showTimePicker(context,
                theme: const DatePickerTheme(
                  containerHeight: 210.0,
                ),
                showSecondsColumn: false,
                showTitleActions: true, onConfirm: (time) {
              print('confirm $time');
              _starttime = '${time.hour} : ${time.minute}';
              setState(() {});
            }, currentTime: DateTime.now(), locale: LocaleType.ko);
            setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Text("시작 시간"),
                    Container(
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.access_time,
                            size: 18.0,
                            color: Colors.black,
                          ),
                          Text(
                            " $_starttime",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            DatePicker.showTimePicker(context,
                theme: const DatePickerTheme(
                  containerHeight: 210.0,
                ),
                showSecondsColumn: false,
                showTitleActions: true, onConfirm: (time) {
              print('confirm $time');
              _endtime = '${time.hour} : ${time.minute}';
              setState(() {});
            }, currentTime: DateTime.now(), locale: LocaleType.ko);
            setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Text("종료 시간"),
                    Container(
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.access_time,
                            size: 18.0,
                            color: Colors.black,
                          ),
                          Text(
                            " $_endtime",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
