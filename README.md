# 🎬 Lonm - تطبيق الأفلام والمسلسلات

تطبيق شامل للأفلام والمسلسلات والرسوم المتحركة والأنمي من جميع أنحاء العالم.

## ✨ الميزات الرئيسية

### المحتوى
- 🌍 أعمال من جميع دول العالم
- 📚 أفلام، مسلسلات، رسوم متحركة، أنمي، كارتون
- 📊 معلومات شاملة عن كل عمل
- 🎭 سير ذاتية للممثلين والفنانين
- ⏱️ معلومات المسلسلات (مواسم، حلقات، مدة كل حلقة)

### الميزات الاجتماعية
- ❤️ نظام الإعجابات والعدم الإعجاب مع عداد
- 💬 التعليقات على التريلرات مع التعديل والحذف
- 📢 نظام البلاغات عن التعليقات (إباحي، حرق، كذب)
- ⭐ المفضلات والمشاهدة لاحقاً
- 🔔 نظام الإشعارات والمنشنات
- 📋 قسم الطلبات والاقتراحات من المستخدمين

### البحث والتصنيفات
- 🔍 بحث ذكي (أول حرفين)
- 📂 تصانيف أفقية: رعب، أكشن، كوميدي، سحر، إثارة، مغامرة، تاريخي، جريمة، حرب، غموض، دراما، كي-دراما، وثائقي، فانتازيا
- 🎬 معلومات المسلسلات (مواسم، حلقات، مدة)

### لوحة التحكم (للمسؤول فقط)
- 🔐 تسجيل دخول برمز L2006
- ✏️ إضافة وتعديل الأعمال
- 🗑️ حذف الطلبات والبلاغات
- 📬 استقبال طلبات المستخدمين والرد عليها

### المنصات
- 📱 تطبيق Mobile (Flutter) - Android و iOS و APK
- 📺 تطبيق Smart TV (Flutter)
- 🌐 واجهة ويب (Safari)

## 📁 هيكل المشروع

```
lonmm/
├── mobile/                  # تطبيق Flutter للموبايل
│   ├── lib/
│   │   ├── main.dart
│   │   ├── screens/
│   │   ├── widgets/
│   │   ├── services/
│   │   ├── models/
│   │   └── constants/
│   ├── pubspec.yaml
│   └── ...
├── smart_tv/                # تطبيق Smart TV
│   ├── lib/
│   │   ├── main.dart
│   │   ├── screens/
│   │   ├── widgets/
│   │   ├── services/
│   │   ├── models/
│   │   └── constants/
│   ├── pubspec.yaml
│   └── ...
├── backend/                 # API والخوادم
│   ├── src/
│   │   ├── routes/
│   │   ├── controllers/
│   │   ├── models/
│   │   ├── middleware/
│   │   └── config/
│   ├── .env.example
│   ├── package.json
│   └── server.js
├── docs/                    # التوثيق
│   └── API.md
├── .gitignore
├── .env.example
└── README.md
```

## 🛠️ التكنولوجيا المستخدمة

- **Frontend Mobile:** Flutter
- **Frontend Smart TV:** Flutter
- **Backend:** Node.js / Express
- **Database:** Firebase / MongoDB
- **Authentication:** Google OAuth
- **APIs:** IMDB API, ITDB API

## 📋 المتطلبات

- Flutter SDK
- Node.js و npm
- Firebase Account أو MongoDB
- IMDB API Key
- ITDB API Key

## 🚀 البدء السريع

### تطبيق الموبايل
```bash
cd mobile
flutter pub get
flutter run
```

### تطبيق Smart TV
```bash
cd smart_tv
flutter pub get
flutter run
```

### الخادم (Backend)
```bash
cd backend
npm install
npm start
```

## 👤 معلومات المسؤول

- **البريد:** tr31t2syr@gmail.com
- **رمز الإدارة:** L2006

## 📝 الملاحظات المهمة

- جميع الواجهات باللغة العربية
- أسماء الأعمال بالإنجليزية (ماعدا الأعمال العربية)
- أداء عالي وسرعة استجابة فورية
- لا توجد أعمال مستقبلية، فقط الموجودة حالياً
- التسجيل الدخول عبر Google OAuth
- بدون حساب، لا يمكن التعليق أو الإعجاب أو الطلب

---

**تم إنشاء المشروع بنجاح! 🚀**
