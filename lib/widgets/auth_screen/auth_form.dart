import 'package:ed_app/enums/auth/auth_mode.dart';
import 'package:ed_app/shared/firebase/firebase_authentication.dart';
import 'package:ed_app/tools/form_tool.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.Login;

  final _authManager = FirebaseAuthentication();

  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  void changeAuthMode() {
    setState(() {
      if (_authMode == AuthMode.Login) {
        _authMode = AuthMode.Register;
      } else {
        _authMode = AuthMode.Login;
      }
    });
  }

  List<Widget> _fromContent(BuildContext context) {
    List<Widget> formContent = [];

    formContent.add(Text(
      getModeName(_authMode),
      style: Theme.of(context).primaryTextTheme.headline5,
    ));

    formContent.add(SizedBox(
      height: 40,
    ));

    formContent.addAll(_formInputs());

    formContent.add(SizedBox(
      height: 20,
    ));

    formContent.addAll(_actionButtons());

    formContent.add(SizedBox(
      height: 20,
    ));

    formContent.add(_googleButton());

    return formContent;
  }

  List<Widget> _formInputs() {
    List<Widget> formInputs = [];

    formInputs.add(TextFormField(
      controller: _emailFieldController,
      decoration: InputDecoration(hintText: "Email"),
      validator: FormTool.emailFieldValidator,
    ));

    formInputs.add(SizedBox(
      height: 20,
    ));

    formInputs.add(TextFormField(
      controller: _passwordFieldController,
      decoration: InputDecoration(hintText: "Password"),
      validator: FormTool.emptyFieldValidator,
    ));

    return formInputs;
  }

  List<Widget> _actionButtons() {
    List<Widget> actionButtons = [];

    if (_authMode == AuthMode.Login) {
      actionButtons
          .add(ElevatedButton(onPressed: submit, child: Text("Login")));
      actionButtons.add(TextButton(
          onPressed: changeAuthMode, child: Text("Create new account!")));
    } else {
      actionButtons
          .add(ElevatedButton(onPressed: submit, child: Text("Register")));
      actionButtons.add(TextButton(
          onPressed: changeAuthMode,
          child: Text("Already have an account? Sign In!")));
    }

    return actionButtons;
  }

  Widget _googleButton() {
    return ElevatedButton(onPressed: signInWithGoogle, child: Text("Sign in with Google"));
  }

  void submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    if (_authMode == AuthMode.Register) {
      var registratedUser = await _authManager.createUser(
          _emailFieldController.text, _passwordFieldController.text);

      if (registratedUser == null) {
        print("registration error");
        return;
      }
    }

    var authorizedUser = await _authManager.login(
        _emailFieldController.text, _passwordFieldController.text);

    if (authorizedUser == null) {
      print("login error");
      return;
    }
  }

  void signInWithGoogle() async {
    var user = await _authManager.signInWithGoogle();

    if (user == null) {
      print("Google auth error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _fromContent(context),
            )),
      ),
    );
  }
}
