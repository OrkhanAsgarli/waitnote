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
## 📸 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/72fd7e4c-3fc8-4dd8-b1f1-e05070f60ce5" width="250"/>
  <img src="https://github.com/user-attachments/assets/efc68961-c739-474a-8eb3-fd43e768aa8c" width="250"/>
  <img src="https://github.com/user-attachments/assets/3df6ef51-0a1b-46ce-ad10-b48cd36c2ec1" width="250"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/8b81df97-d99f-4f66-85fe-118b670cfb46" width="250"/>
  <img src="https://github.com/user-attachments/assets/52651f6d-7cf7-4d2e-b2d2-355a3229d0fb" width="250"/>
  <img src="https://github.com/user-attachments/assets/9c205ffb-1b76-46c2-8db1-53c680309482" width="250"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/dc480f04-fe40-45e9-9592-4437440cc5b1" width="250"/>
  <img src="https://github.com/user-attachments/assets/17d7e715-b2e3-449d-84e9-f5770aff7d31" width="250"/>
  <img src="https://github.com/user-attachments/assets/19baf5f5-85be-4fd7-9b9b-b6a1c56b5008" width="250"/>
</p>


---

<p align="center">Made with ❤️ using Flutter</p>
