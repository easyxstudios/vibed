import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibed/core/theme/extensions/theme_extension.dart';
import 'package:vibed/modules/decks/api/firebase_sync_service.dart';
import 'package:vibed/modules/decks/data/sample_data.dart';

class FirebaseSyncButton extends ConsumerStatefulWidget {
  const FirebaseSyncButton({super.key});

  @override
  ConsumerState<FirebaseSyncButton> createState() => _FirebaseSyncButtonState();
}

class _FirebaseSyncButtonState extends ConsumerState<FirebaseSyncButton> {
  bool _isLoading = false;
  SyncProgress? _currentProgress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.cloud_upload, color: context.colors.primary),
          title: const Text('Firebase\'e Data Sync Et'),
          subtitle: const Text('Örnek verileri Firebase Firestore\'a yükle'),
          trailing: _isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Icon(
                  Icons.arrow_forward_ios,
                  color: context.colors.grey1,
                  size: 16,
                ),
          onTap: _isLoading ? null : _showSyncConfirmationDialog,
        ),
        if (_currentProgress != null) _buildProgressIndicator(),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    final progress = _currentProgress!;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.grey2.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (progress.isCompleted)
                Icon(Icons.check_circle, color: Colors.green, size: 20)
              else if (progress.error != null)
                Icon(Icons.error, color: context.colors.error, size: 20)
              else
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    value: progress.progress,
                  ),
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  progress.message,
                  style: TextStyle(
                    color: progress.error != null
                        ? context.colors.error
                        : context.colors.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          if (progress.error == null && !progress.isCompleted) ...[
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress.progress,
              backgroundColor: context.colors.grey2.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary),
            ),
          ],
          if (progress.error != null) ...[
            const SizedBox(height: 8),
            Text(
              'Hata: ${progress.error}',
              style: TextStyle(color: context.colors.error, fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _showSyncConfirmationDialog() async {
    final syncService = ref.read(firebaseSyncServiceProvider);

    // Check if data already exists
    final hasData = await syncService.hasExistingData();
    final counts = await syncService.getCollectionCounts();

    if (!mounted) return;

    final shouldProceed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Firebase Data Sync'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bu işlem örnek verileri Firebase Firestore\'a yükleyecek:',
            ),
            const SizedBox(height: 12),
            Text('• ${SampleData.categories.length} kategori'),
            Text('• ${SampleData.allCards.length} kart'),
            Text('• ${SampleData.decks.length} deste'),
            Text('• ${SampleData.sections.length} bölüm'),
            if (hasData) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '⚠️ Mevcut Veriler:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...counts.entries.map(
                      (entry) => Text('• ${entry.key}: ${entry.value} kayıt'),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Mevcut veriler değiştirilecek!',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 12),
            const Text(
              'Devam etmek istiyor musunuz?',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Sync Et'),
          ),
        ],
      ),
    );

    if (shouldProceed == true) {
      _startSync(clearExisting: hasData);
    }
  }

  Future<void> _startSync({bool clearExisting = false}) async {
    setState(() {
      _isLoading = true;
      _currentProgress = null;
    });

    try {
      final syncService = ref.read(firebaseSyncServiceProvider);

      await syncService.syncAllData(
        clearExisting: clearExisting,
        onProgress: (progress) {
          if (mounted) {
            setState(() {
              _currentProgress = progress;
            });
          }
        },
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Firebase sync başarıyla tamamlandı!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Sync hatası: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
