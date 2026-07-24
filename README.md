<p align="center">
  <img width="400" height="400" alt="gemini-svg" src="https://github.com/user-attachments/assets/db0602e6-8fd7-4e0b-aab1-bff8ba7edfe7" />

</p>

<h1 align="center">WaitNote</h1>

<p align="center">
  Restoran və kafelər üçün sifariş, masa və məhsul idarəetmə tətbiqi Əsas Məqsəd Ofisiantlar Üçün Hazırlanmışdır  — Flutter ilə hazırlanıb.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-3.11-0175C2?logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Windows%20%7C%20macOS%20%7C%20Linux%20%7C%20Web-informational" />
</p>

---

## 📖 Haqqında

**WaitNote**, restoran, kafe və digər ictimai iaşə obyektlərinin gündəlik əməliyyatlarını (masalar, sifarişlər, məhsullar, kateqoriyalar və statistika) rahat idarə etmək üçün nəzərdə tutulmuş çarpaz-platforma (cross-platform) bir Flutter tətbiqidir. Tətbiq lokal SQLite (Drift) verilənlər bazası üzərində işləyir və internet bağlantısı olmadan da tam funksionaldır.

## ✨ Əsas Xüsusiyyətlər

- 🏠 **Dashboard** — günün ümumi statistikası (satış, aktiv sifarişlər, dolu masalar və s.) bir baxışda
- 🍽️ **Masaların idarə edilməsi** — masa əlavə etmə, redaktə etmə, status (boş/dolu) izləmə və filtrləmə
- 🧾 **Sifarişlərin idarə edilməsi** — masalara sifariş yaratma, məhsul əlavə etmə, sifariş tarixçəsi
- 📦 **Məhsullar** — məhsul əlavə etmə/redaktə, şəkil seçimi (image picker) ilə
- 🗂️ **Kateqoriyalar** — məhsulları kateqoriyalara ayıraraq təşkil etmə
- 📊 **Statistika** — satış və sifariş analitikası
- ⚙️ **Ayarlar** — tətbiq parametrləri və "Haqqında" səhifəsi
- 💾 **Offline-first** — bütün data lokal SQLite (Drift) bazasında saxlanılır
- 🎨 **Modern UI** — Google Fonts və `flutter_animate` ilə zərif animasiyalar

## 🛠️ Texnologiya Stack

| Kateqoriya | Paket |
|---|---|
| State Management | [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) |
| Naviqasiya | [go_router](https://pub.dev/packages/go_router) |
| Verilənlər bazası | [drift](https://pub.dev/packages/drift) (SQLite üzərində) |
| UI / Fontlar | [google_fonts](https://pub.dev/packages/google_fonts), [flutter_animate](https://pub.dev/packages/flutter_animate) |
| Şəkillər | [image_picker](https://pub.dev/packages/image_picker) |
| Digər | `rxdart`, `uuid`, `intl`, `path_provider`, `collection` |

## 📱 Dəstəklənən Platformalar

Android · iOS · macOS · Windows · Linux · Web

## 📂 Layihə Strukturu

```
project/
├── lib/
│   ├── core/
│   │   ├── router/        # go_router konfiqurasiyası
│   │   └── theme/         # rənglər, tipoqrafiya, spacing, tema
│   ├── data/
│   │   ├── database/      # Drift cədvəlləri, DAO-lar, provider-lər
│   │   ├── models/        # data modelləri
│   │   └── repositories/  # repository qatı
│   ├── features/
│   │   ├── categories/    # kateqoriya idarəetməsi
│   │   ├── dashboard/     # əsas panel
│   │   ├── orders/        # sifarişlər
│   │   ├── products/      # məhsullar
│   │   ├── settings/      # ayarlar / haqqında
│   │   ├── statistics/    # statistika
│   │   └── tables/        # masalar
│   ├── services/          # köməkçi servislər
│   ├── shared/             # ortaq widget-lər (buttons, cards, forms, states)
│   └── main.dart
├── android/ ios/ macos/ windows/ linux/ web/
└── pubspec.yaml
```

## 🚀 Quraşdırma

### Tələblər

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart >= 3.11)
- Android Studio / Xcode (mobil development üçün) və ya istənilən IDE (VS Code tövsiyə olunur)

### Addımlar

```bash
# Repozitoriyanı klonlayın
git clone https://github.com/OrkhanAsgarli/waitnote.git
cd waitnote/project

# Asılılıqları yükləyin
flutter pub get

# Drift/build_runner koduları generasiya edin (lazım olduqda)
dart run build_runner build --delete-conflicting-outputs

# Tətbiqi işə salın
flutter run
```

Müəyyən platformada işə salmaq üçün:

```bash
flutter run -d chrome     # Web
flutter run -d windows    # Windows
flutter run -d macos      # macOS
flutter run -d linux      # Linux
```

## 🤝 Töhfə vermək

Pull request-lər və issue-lar açıqdır. Böyük dəyişikliklər üçün əvvəlcə bir issue açıb müzakirə etmək tövsiyə olunur.

## 📄 Layihə Fotoları
---


<p align="center">
  <img src="https://github.com/user-attachments/assets/58fa433b-941d-4694-9261-dda5df6e9e52" width="220"/>
  <img src="https://github.com/user-attachments/assets/d5ab93af-97fd-4d08-9f0f-1ab05beb742c" width="220"/>
  <img src="https://github.com/user-attachments/assets/1fea22c6-6ef6-46ca-af39-2e1257effd73" width="220"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/dbfc5ad2-8bfe-4e39-9b3e-dbf032b58853" width="220"/>
  <img src="https://github.com/user-attachments/assets/eddc18be-a7f1-485f-9571-9939a8ceb586" width="220"/>
  <img src="https://github.com/user-attachments/assets/9e948502-7aaa-4f53-87fb-8638cecf9d71" width="220"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/ab33511f-bc5f-4ac2-8217-9eb83004d46c" width="220"/>
  <img src="https://github.com/user-attachments/assets/63226f5c-e136-4395-b32b-b97bc49f2246" width="220"/>
  <img src="https://github.com/user-attachments/assets/0bb8e618-cb54-410d-ae6c-f46e90d7ccc1" width="220"/>
</p>


---

<p align="center">Made with ❤️ using Flutter</p>
