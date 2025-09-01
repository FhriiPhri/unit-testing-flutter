import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tugas_flutter_testing/widgets/login_form.dart';

void main() {
  testWidgets('Form login berhasil submit dengan input valid',
      (WidgetTester tester) async {
    String? submittedEmail;
    String? submittedPassword;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: LoginForm(
          onLogin: (email, password) {
            submittedEmail = email;
            submittedPassword = password;
          },
        ),
      ),
    ));

    // Input email & password
    await tester.enterText(find.byKey(const Key('emailField')), 'test@mail.com');
    await tester.enterText(find.byKey(const Key('passwordField')), '123456');
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pump();

    expect(submittedEmail, 'test@mail.com');
    expect(submittedPassword, '123456');
  });
}