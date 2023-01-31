import 'dart:io';

import 'package:flutter/material.dart';
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

  late NumberPicker integerNumberPicker;

  _handleValueChanged(int value) {
    setState(() => _currentnumofmembers = value);
  }

  _handleValueChangedExternally(int value) {
    setState(() => _currentnumofmembers = value);
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
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          _selectedDate == null
                              ? '파티일자'
                              : '{$_selectedDate}'.substring(1, 11),
                          style: TextStyle(
                            color: _selectedDate == null
                                ? Colors.grey
                                : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Future<DateTime?> future = showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );

                        future.then((date) {
                          setState(() {
                            _selectedDate = date;
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
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
                StatefulBuilder(builder: (context, SbsetState) {
                  return NumberPicker(
                      minValue: 0,
                      maxValue: 30,
                      step: 1,
                      value: _currentnumofmembers,
                      onChanged: (value) {
                        setState(() {
                          _currentnumofmembers = value;
                        });
                        SbsetState(() {
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

class NumOfMembers extends StatefulWidget {
  const NumOfMembers({super.key});

  @override
  State<NumOfMembers> createState() => _NumOfMembersState();
}

class _NumOfMembersState extends State<NumOfMembers> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<Calendar> createState() => _Calendar();
}

class _Calendar extends State<Calendar> with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(selectedDate, 'selected_date');
    registerForRestoration(
        restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${selectedDate.value.day}/${selectedDate.value.month}/${selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            restorableDatePickerRouteFuture.present();
          },
          child: const Text('Open Date Picker'),
        ),
      ),
    );
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
