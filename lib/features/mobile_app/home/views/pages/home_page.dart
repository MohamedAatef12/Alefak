import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../widgets/home_page_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HomeBloc.fromDI()
            ..add(
              FetchPostsEvent(),
            ),
          child: HomePageContent(),
        ),
      ),
    );
  }
}
