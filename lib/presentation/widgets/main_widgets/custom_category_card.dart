import 'package:alif/data/models/service_type_model.dart';
import 'package:alif/utils/constants/api_constants.dart';
import 'package:alif/utils/style/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomTypeCard extends StatelessWidget {
  const CustomTypeCard({super.key, required this.type});
  final ServiceTypeModel? type;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AspectRatio(
      aspectRatio: 335 / 100,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsetsDirectional.symmetric(
              vertical: height * 0.0075,
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                width: 0.5,
                color: AppColors.onSecondary,
              ),
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                width: 0.5,
                color: AppColors.onSecondary,
              ),
              gradient: RadialGradient(
                center: Alignment.center,
                radius: width * 0.0035,
                colors: [
                  AppColors.onPrimary,
                  AppColors.onPrimary.withOpacity(0),
                ],
              ),
            ),
            alignment: AlignmentDirectional.center,
            child: type?.image == null
                ? null
                : ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: CachedNetworkImage(
                      imageUrl: ApiConstants.getImagePath(type!.image!),
                      placeholder: (context, url) => Center(
                        child:
                            CircularProgressIndicator(color: AppColors.surface),
                      ),
                      errorWidget: (context, url, error) => SizedBox(),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: height * 0.0075),
            child: InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, '/type', arguments: type),
              borderRadius: BorderRadius.circular(18),
              child: Center(
                child: Text(
                  type?.name ?? 'الإســم',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.surface,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
