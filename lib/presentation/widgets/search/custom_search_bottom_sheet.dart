import 'package:alif/utils/style/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBottomSheet extends StatelessWidget {
  const CustomSearchBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.45,
      color: AppColors.transparent,
      padding: EdgeInsetsDirectional.only(top: height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: Text(
              'تصنيف',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: height * 0.05,
            child: ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: width * 0.03,
              ),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.015),
              itemBuilder: (context, index) => Chip(
                label: Text('data'),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: Text(
              'فئة فرعية',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: height * 0.05,
            child: ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: width * 0.03,
              ),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.015),
              itemBuilder: (context, index) => Chip(
                label: Text('data'),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: Text(
              'فرز حسب',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: height * 0.05,
            child: ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: width * 0.03,
              ),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.015),
              itemBuilder: (context, index) => Chip(
                label: Text('data'),
              ),
            ),
          ),
          Spacer(flex: 2),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: width * 0.03),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(
                          width: 1,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      minimumSize: Size.fromHeight(height * 0.06),
                    ),
                    child: Text(
                      'إلغاء الكل',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 10,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.onPrimary,
                      side: BorderSide(color: AppColors.onPrimary),
                      minimumSize: Size.fromHeight(height * 0.06),
                    ),
                    child: Text(
                      'تطبيق',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.surface,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
