import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_transisi/src/constants/constants.dart';
import 'package:flutter_transisi/src/features/employees/domain/employees.dart';

class EmployeesListTile extends StatelessWidget {
  const EmployeesListTile({Key? key, required this.employees})
      : super(key: key);

  final Employees employees;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppThemes.white,
            boxShadow: [
              BoxShadow(
                color: AppThemes.grey.withOpacity(0.2), //color of shadow
                spreadRadius: 1, //spread radius
                blurRadius: 1, // blur radius
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: employees.avatar,
                  height: 70,
                  width: 70,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${employees.firstName} ${employees.lastName}",
                      style: AppThemes.headline2,
                    ),
                    Text(employees.email),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
