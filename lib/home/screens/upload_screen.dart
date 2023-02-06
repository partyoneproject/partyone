import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
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
  double? addressLatitude = 0.0;
  double? addressLongtidue = 0.0;

  var partyname = TextEditingController();

  XFile? _pickedFile;
  String interest = "공부";
  List<String> values = [];
  int _currentnumofmembers = 0;
  Map<String, String> data = {};
  void onDelete(int idx) {
    setState(() {
      values.removeAt(idx);
    });
  }

  //TODO 널 체킹
  void DataPackaging() async {
    data["image"] = _pickedFile!.path;

    data["파티이름"] = partyname.text;
    data["최소인원수"] = "$_currentnumofmembers";
    data["최소인원수"] = "$_currentnumofmembers";
    data["관심분야"] = interest;
    data["장소"] = currentAddress;
    data["장소 위도"] = "$addressLatitude";
    data["장소 경도"] = "$addressLongtidue";
    data["날짜"] = "";
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
              TextField(
                controller: partyname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '파티이름',
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
                                addressLatitude = result.latitude;
                                addressLongtidue = result.longitude;
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
              const SizedBox(
                height: 20.0,
              ),
              //파티 날짜
              Row(children: const [DateTimePicker()]),
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
                      hasAddButton: false,
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
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
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
          ],
        ),

        //시작시간
        Column(
          children: [
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
            //종료시간
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
        ),
      ],
    );
  }
}

class TimePick extends StatefulWidget {
  const TimePick({super.key});

  @override
  State<TimePick> createState() => _TimePickState();
}

class _TimePickState extends State<TimePick> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: <Widget>[
          hourMinute15Interval(),
          hourMinute12H()
          // Container(
          //   margin: const EdgeInsets.symmetric(vertical: 50),
          //   child: Text(
          //     '${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}:${_dateTime.second.toString().padLeft(2, '0')}',
          //     style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          //   ),
          // ),
        ],
      ),
    );
  }

  /// SAMPLE
  Widget hourMinute12H() {
    return TimePickerSpinner(
      is24HourMode: false,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget hourMinuteSecond() {
    return TimePickerSpinner(
      isShowSeconds: true,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget hourMinute15Interval() {
    return TimePickerSpinner(
      spacing: 40,
      minutesInterval: 15,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget hourMinute12HCustomStyle() {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: const TextStyle(fontSize: 24, color: Colors.deepOrange),
      highlightedTextStyle: const TextStyle(fontSize: 24, color: Colors.yellow),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      minutesInterval: 15,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
