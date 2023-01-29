import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:email_validator/email_validator.dart';
import 'package:partyone/screens/tab_screen/home_screen.dart';

class SchoolCertificationScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController authenticationNumber = TextEditingController();
  bool isValidEmail = false;
  bool isSendEmail = true;

  SchoolCertificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: LoginAppBar('학교 인증'),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "이메일",
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '이메일을 입력하세요',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffC4C4C4)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            if (isSendEmail) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "인증번호",
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      controller: authenticationNumber,
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '인증번호를 입력하세요',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
            isSendEmail
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 326,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(
                          isValidEmail ? 0xffE6E6E6 : 0x80E6E6E6,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "로그인",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      sendEmail(emailController.text);
                    },
                    child: Container(
                      width: 326,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(
                          isValidEmail ? 0xffE6E6E6 : 0x80E6E6E6,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "인증번호 발송",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 30,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (const TypeInfoScreen()),
                        ),
                      );
                    },
                    child: const Text("신규 회원가입   "),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("인증번호 재발송"),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class LoginAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  LoginAppBar(
    this.title,
  );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      foregroundColor: const Color(0xff636363),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xff636363)),
      ),
    );
  }
}

class TypeInfoScreen extends StatefulWidget {
  const TypeInfoScreen({super.key});

  @override
  State<TypeInfoScreen> createState() => _SignUpTypeInfoState();
}

class _SignUpTypeInfoState extends State<TypeInfoScreen> {
  TextEditingController name = TextEditingController();
  DateTime? _selectedDate;

  final List<bool> _selections = List.generate(2, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginAppBar('회원가입'),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '이름',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      controller: name,
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '홍길동',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '성별',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ToggleButtons(
                        isSelected: _selections,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 70) / 2,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text(
                                '남',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 70) / 2,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text(
                                '여',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                        onPressed: (int index) {
                          setState(() {
                            _selections[index] = !_selections[index];
                            _selections[(index + 1) % 2] = !_selections[index];
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '생년월일',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        OutlinedButton(
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                _selectedDate == null
                                    ? 'Open Date Picker'
                                    : '{$_selectedDate}'.substring(1, 11),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: _selectedDate == null
                                      ? Colors.grey
                                      : Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Future<DateTime?> future = showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );

                            future.then((date) {
                              setState(() {
                                _selectedDate = date;
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (const AgreementScreen()),
                          ),
                        );
                      },
                      child: Container(
                        width: 326,
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "확인",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<Calendar> createState() => _Calendar();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _Calendar extends State<Calendar> with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
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
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
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
            _restorableDatePickerRouteFuture.present();
          },
          child: const Text('Open Date Picker'),
        ),
      ),
    );
  }
}

void sendEmail(String recipients) async {
  // final String recipients;
  final Email email = Email(
    body: '',
    subject: '[PartyOne] 인증번호 발송',
    recipients: [recipients],
    cc: [],
    bcc: [],
    attachmentPaths: [],
    isHTML: false,
  );

  try {
    await FlutterEmailSender.send(email);
  } catch (error) {}
}

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  List<bool> isAgreed = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LoginAppBar('약관동의'),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                const SizedBox(height: 120),
                Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAgreed[0] = !isAgreed[0];
                              if (isAgreed[0] & isAgreed[1]) {
                                isAgreed[2] = true;
                              } else {
                                isAgreed[2] = false;
                              }
                            });
                          },
                          child: Icon(isAgreed[0]
                              ? Icons.check_circle
                              : Icons.check_circle_outline),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 104,
                          padding: const EdgeInsets.only(
                            bottom: 5,
                          ),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: const Text(
                            "약관 1",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAgreed[1] = !isAgreed[1];
                              if (isAgreed[0] & isAgreed[1]) {
                                isAgreed[2] = true;
                              } else {
                                isAgreed[2] = false;
                              }
                            });
                          },
                          child: Icon(isAgreed[1]
                              ? Icons.check_circle
                              : Icons.check_circle_outline),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 104,
                          padding: const EdgeInsets.only(
                            bottom: 5,
                          ),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: const Text(
                            "약관 2",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAgreed[2] = !isAgreed[2];
                              if (isAgreed[2]) {
                                isAgreed[0] = true;
                                isAgreed[1] = true;
                              } else {
                                isAgreed[0] = false;
                                isAgreed[1] = false;
                              }
                            });
                          },
                          child: Icon(isAgreed[2]
                              ? Icons.check_circle
                              : Icons.check_circle_outline),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 104,
                          padding: const EdgeInsets.only(
                            bottom: 5,
                          ),
                          child: const Text(
                            "전체 동의",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (const InterestScreen()),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "다음",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginAppBar('관심분야 설정'),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const SizedBox(
                height: 500,
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate.fixed(
                        [
                          InterestIconRow(),
                          InterestIconRow(),
                          InterestIconRow(),
                          InterestIconRow(),
                          InterestIconRow(),
                          InterestIconRow(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 100) / 2,
                    height: 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all()),
                    child: const Center(
                      child: Text(
                        "건너뛰기",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 100) / 2,
                    height: 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all()),
                    child: const Center(
                      child: Text(
                        "확인",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InterestIconRow extends StatelessWidget {
  const InterestIconRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            InterestIcon(),
            Spacer(),
            InterestIcon(),
            Spacer(),
            InterestIcon(),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

class InterestIcon extends StatelessWidget {
  const InterestIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
