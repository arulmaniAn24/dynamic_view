import 'package:flutter/material.dart';

import 'widgets/datepicker.dart';
import 'widgets/tasktitle.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:const Color.fromARGB(255, 8, 14, 83),
        body: CustomScrollView(
          slivers: [
           _buildAppBar(context),
           SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Datepicker(),
                    Tasktile(),
              ],),
            ),
           ),
          ],
        ),
      ),
    );

  }
  Widget _buildAppBar(BuildContext context)
  {
    return SliverAppBar(
      expandedHeight: 100,
      backgroundColor: const Color.fromARGB(255, 8, 14, 83),
      leading: IconButton(icon: const Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,),
      onPressed: (){},
      ),
      actions: const [
        Icon(Icons.more_vert,size: 30,color: Colors.white,),
      ],
      flexibleSpace: const FlexibleSpaceBar(
        title: Center(
          child: Text(
            "Project Timeline",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        titlePadding: EdgeInsets.only(top: 5),
      ),
    );
  }
}