import 'package:bmas/core/injector_container.dart';
import 'package:bmas/presentation/bloc/home_content/home_content_bloc.dart';
import 'package:bmas/presentation/home/component/blog_widget.dart';
import 'package:bmas/presentation/home/component/product_widget.dart';
import 'package:bmas/presentation/widget/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeContentBloc>()..add(GetHomeContentEvent()),
      child: Stack(
        children: [
          Scaffold(
              appBar: AppBar(
                title: const Text('Flutter Assignment'),
              ),
              body: BlocBuilder<HomeContentBloc, HomeContentState>(
                builder: (context, state) {
                  return ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    children: [
                      ProductWidget(content: state.homeContent?.products),
                      BlogWidget(content: state.homeContent?.articles)
                    ],
                  );
                },
              )),
          BlocBuilder<HomeContentBloc, HomeContentState>(
            builder: (context, state) {
              if (state.status == GetHomeContentStatus.loading) {
                return const LoadingDialogWidget();
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
