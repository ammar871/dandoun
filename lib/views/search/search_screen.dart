import 'package:dandoun/bloc/post_cubit/post_cubit.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/models/home_model.dart';
import 'package:dandoun/views/all_posts_screen/componts/item_all_posts_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/functions.dart';
import '../../helpers/helper_function.dart';
import '../../widget/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        automaticallyImplyLeading: false,
centerTitle: true,
        title:  Text(
          "صفحة البحث",
          style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color!, fontFamily: "pnuR"),
        ),
      ),
      body: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 60,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: textColor,
                  ),
                  child:  ListTile(
                    leading:   Icon(Icons.search,color: Theme.of(context).textTheme.bodyText1!.color!,),
                    title:  TextField(
                      controller: _nameController,
                      style:  TextStyle(
                        fontFamily: 'pnuR',
                        fontSize: 15,
                        color: Theme.of(context).textTheme.bodyText1!.color!,
                        fontWeight: FontWeight.w700,

                      ),
                      decoration:  const InputDecoration(
                          hintText: "اكتب كلمة البحث", border: InputBorder.none),
                      onChanged: (value){
                       PostCubit.get(context).searchPostsData(name: value);
                      },
                    ),
                    trailing:  IconButton(icon:   Icon(Icons.cancel,color: Theme.of(context).textTheme.bodyText1!.color!,), onPressed: () {
                      _nameController.clear();
                      PostCubit.get(context).searchPostsData(name: "");
                    },),
                  ),
                ),
                Expanded(
                    child: PostCubit.get(context).loadPostSearch
                        ?  Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).textTheme.bodyText1!.color!,
                        strokeWidth: 3,
                      ),
                    )
                        : ListView.builder(
                        itemCount:
                        PostCubit.get(context).searchPosts.length,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        itemBuilder: (ctx, index) {
                          Post post = PostCubit.get(context)
                              .searchPosts[index];

                          return ItemAllPostList(post: post);
                        }))
              ],
            ),
          );
        },
      ),
    );
  }
}