part of '../navigation_screen.dart';

class _NavigationBarItem extends StatelessWidget {
  final String title;
  final String assetName;
  final bool isSelected;
  final Function() onTap;

  const _NavigationBarItem({
    required this.isSelected,
    required this.assetName,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ColoredBox(
          color: isSelected ? Color(0xFFEAF4F2) : Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 14.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  assetName,
                  width: 24.w,
                  color: isSelected ? AppColors.green69 : null,
                ),
                if (isSelected) ...[
                  horizontalSpace(14),
                  Text(title, style: TextStyles.font14green69Bold),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
