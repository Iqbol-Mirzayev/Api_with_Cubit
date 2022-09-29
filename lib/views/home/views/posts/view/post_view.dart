import 'package:api_with_cubit/views/home/views/posts/cubit/post_cubit.dart';
import 'package:api_with_cubit/views/home/views/posts/cubit/post_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit()..getData(),
      child: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          if (state is PostErrorState) {
            const Text("Error State here");
            return;
          }
        },
        builder: (context, state) {
          return Scaffold(
            
            appBar: AppBar(
              backgroundColor: Colors.transparent,elevation: 0,
              title: const Text(
                "Post Page",
                style: TextStyle(
                  fontSize: 30,
                  color: CupertinoColors.activeGreen,
                ),
              ),
              centerTitle: true,
            ),
            body: BlocBuilder<PostCubit, PostState>(
              builder: (context, state) {
                if (state is PostInitialState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is PostCompletedState) {
                  state.data;
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        
                        child: ListTile(
                          title: Text(
                            state.data[index]["title"],
                            maxLines: 3,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("No Internet"),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
