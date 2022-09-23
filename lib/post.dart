import 'package:apigetgetx/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostApi extends StatelessWidget {
  const PostApi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Api')),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          authenticationpost().apiServicePost();
        },
        child: Text('Put'),
      )),
    );
  }
}
