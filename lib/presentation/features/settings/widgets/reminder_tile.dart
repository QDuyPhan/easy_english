import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  final bool enabled;
  final int hour;
  final int minute;
  final VoidCallback onTapTime;
  final ValueChanged<bool> onToggle;

  const ReminderTile({
    super.key,
    required this.enabled,
    required this.hour,
    required this.minute,
    required this.onTapTime,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        _buildTile(
          context,
          icon: Icons.notifications_active_outlined,
          title: 'Nhắc nhở học từ',
          subtitle:
              enabled
                  ? 'Hàng ngày lúc ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}'
                  : 'Tắt nhắc nhở',
          trailing: Switch.adaptive(
            value: enabled,
            onChanged: onToggle,
            activeColor: colorScheme.primary,
          ),
        ),
        if (enabled)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: _buildTile(
              context,
              icon: Icons.access_time_rounded,
              title: 'Thời gian nhắc nhở',
              subtitle:
                  '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}',
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: colorScheme.primary,
              ),
              onTap: onTapTime,
            ),
          ),
      ],
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorScheme.surfaceVariant.withOpacity(0.3),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              children: [
                Icon(icon, color: colorScheme.primary),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
