import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user/user_bloc.dart';
import '../user/user_event.dart';
import '../user/user_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserBloc? _userBloc;
  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc?.add(GetPostList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          title: const Text("Posts Page"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ));
            } else if (state is UserSuccessState) {
              return ListView.builder(
                  itemCount: state.getList.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: ListTile(
                          title: Text(
                            "${index + 1}. ${state.getList[index].title} " ??
                                "",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              state.getList[index].body ?? "",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  height: 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else if (state is UserErrorState) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(state.message),
              ));
            }
            return Container();
          },
        ));
  }
}
