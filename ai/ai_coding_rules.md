
Gemini
محادثة جديدة
البحث في المحادثات
الصور
المكتبة
دفتر ملاحظات جديد
Comprehensive Guide to the History of Economic Thought
Digital Systems and Binary Conversion Techniques
كل دفاتر الملاحظات
تحليل مشروع To-Do ليومين
تثبيت وتشغيل Open Interpreter عبر CMD
حل مشكلة تقييد تطبيق Antigravity
رابط حساب إنستغرام
البحث عن عائلة صفدية
تعلم برمجة فلتر للمبتدئين
تصميم كرت مشروع طباعة الأكواب
تصميم كرت صيدلية مميز
اختيار مسار داعم لـ Flutter
دليل كتابة README احترافي لغيتهاب
إعلان مكتب تجاري بدون صور
حل خطأ 401 في Flutter
استخدام Hive في Flutter للـ Models
تصميم كرت لطباعة الأكواب
حل مشكلة Task Host Windows للابتوب
خطة تعلم إنجليزية لمطور Flutter
بدائل مجانية لتصميم مقاطع الاحتلال
تعديل اسم الكوب بتصميم جديد
تعديل تاريخ كوب التخرج
تعديل الاسم على كوب التخرج
خطة إنقاذ لمادة تاريخ الفكر
تصميم شعار تطبيق الكترو ستور
شرح مبسط وشامل لقواعد الأعداد
تصحيح أسئلة واختبار أداء المستخدم
تصميم كفر لابتوب للمهندسة والجيمر

النشاط
هولندا
من عنوان IP الخاص بجهازك
تعديل الموقع الجغرافي
محادثة مع Gemini
بدي ساوي تطبيق todo

Flutter, firebase, BLoC, clean artch ، بدي تكون فيه عمليات الأربعة الأساسية (قراءة تعديل حذف إضافة) وبدي auth email and password , auth with Google, اشعارات و اشعارات محليه, theme، و Storage ارفع صورة منشان profile وفي بحث

وعم فكر ساوي أصناف للمهام انو مهام للعمل مهام للمنزل مهام تطوير شخصي وهيك...

عم فكر انو اول شي بضيف مهمه رئيسيةوداخلها مهام جزئية

وفي شريط يحطله اديش أنجز من هل مهمه ٧٥٪ ١٠٠٪ وهيك حسب يلي عاملهم

بدنا هلا نحلل الفكرة خاصة لشو الاشعارات

انا عم ساويه بس منشان اثبت انو بعرف اشتغل على firebase بال cv فلازم اشتغل اشعارات

المدة يلي معي يومين فقط مع استخدام الذكاء الاصطناعي بشكل متوسط

منشان يكون نحط أفكار بدها وقت ما بتتلحق فخلي التحليل مناسب للواقع

بناء تطبيق Todo متكامل بالتقنيات المحددة (Flutter, Firebase, BLoC, Clean Architecture) خلال يومين فقط هو تحدٍّ ممتاز، والذكاء الاصطناعي سيختصر عليك وقتاً طويلاً، لكن المفتاح للنجاح هو إدارة نطاق المشروع (Scope Management) واستبعاد أي تقيد زمني قد يمنعك من إنجاز التسليم.

إليك تحليل دقيق وعملي للفكرة مع "هندسة الإشعارات" وخطة عمل مكثفة تناسب مدة اليومين.

1. تحليل الإشعارات (لماذا وكيف؟)
بما أن الهدف الأساسي هو إثبات مهارات Firebase (FCM) في الـ CV، يجب ربط الإشعارات بشرطين: أن تكون ذات معنى منطقي، وأن تكون سهلة التطبيق.

الإشعارات المحلية (Local Notifications):

الفكرة: تذكير بالمهمة عند اقتراب وقت الاستحقاق (Due Date / Reminder).

الهدف: إظهار قدرتك على التعامل مع flutter_local_notifications وضبط المواعيد (Scheduled Notifications).

إشعارات Firebase (FCM Push Notifications):

الفكرة 1 (الأسهل والأسرع): Broadcast/Engagement Push — إرسال إشعار تحفيزي يومي (مثلاً: "لديك مهام معلقة اليوم، ألقِ نظرة!") من خلال Firebase Console مباشرة. (لا تتطلب أي كود Backend أو Cloud Functions).

الفكرة 2 (متقدمة إذا أسعفك الوقت): Milestone Achievement — عند إكمال المهمة الرئيسية بنسبة 100%، يتم إرسال إشعار ترحيبي/مشجع. (يمكن عمل ذلك محلياً أو استدعاء Cloud Function بسيطة لـ FCM).

نصيحة CV: يكفي جداً ضبط استقبال الـ FCM Token، وحفظه في Firestore، واستقبال الإشعارات في Foreground/Background وHandling مع إرسال إشعار اختبار من Firebase Console. هذا يثبت معقتك بـ FCM بنسبة 100%.

2. تحليل معمارية البيانات والخواص المطلوبة
لتقليل تعقيد الكود مع الالتزام بـ Clean Architecture و BLoC:

هيكل المهمة (Task Model)
id: String

title: String

category: String (عمل، منزل، تطوير شخصي...)

subTasks: List (كل SubTask تحتوي على title و isDone)

reminderDateTime: DateTime?

isCompleted: Bool (تحسب تلقائياً أو عند اكتمال كافة المهام الفرعية)

شريط التقدم (Progress Bar)
الحساب: 
Progress=( 
إجمالي المهام الفرعية
عدد المهام الفرعية المنجزة
​
 )×100

إذا لم توجد مهام فرعية، تعتمد على حالة المهمة الرئيسية (0% أو 100%).

3. خطة التنفيذ المقترحة (جدول الـ 48 ساعة)
اليوم الأول: البنية والأساسيات (Auth + Firebase Core + Core Features)
التهيئة (2 ساعة):

إعداد مشروع Flutter وتطبيق Clean Architecture (Data, Domain, Presentation).

ربط Firebase (Auth, Firestore, Storage, Messaging).

المصادقة Auth (3 ساعات):

تسجيل الدخول بـ Email/Password + Google Sign-In.

رفع صورة الملف الشخصي إلى Firebase Storage عند التسجيل/التعديل.

إدارة المهام CRUD (4 ساعات):

إنشاء Firestore Service للـ CRUD (إضافة، قراءة مع Real-time Stream، تعديل، حذف).

إمكانية إضافة مهام فرعية وشريط التقدم.

اليوم الثاني: الميزات الإضافية والتلميع (Search + Theme + Notifications)
البحث والأصناف (2 ساعة):

فلترة القائمة حسب الأصناف (Category Filter).

شريط بحث محلي (Search Bar) يفلتر القائمة الحالية بناءً على العنوان.

الثيمات (1 ساعة):

إعداد Light / Dark Theme باستخدام BLoC بسيط لحفظ الحالة (ThemeBloc) مع shared_preferences.

الإشعارات (3 ساعات):

إعداد flutter_local_notifications لتذكير المهام.

إعداد firebase_messaging للحصول على FCM Token واختبار استقبال الإشعارات من Firebase Console.

التنظيف والمراجعة (2 ساعة):

رفع الكود على GitHub مع كتابة README.md احترافي يشرح الميزات والمعمارية وFirebase Services المستخدمة (هذا مهم جداً للـ CV).

4. حيل لتوفير الوقت مع الذكاء الاصطناعي (AI Prompting Tricks)
Clean Architecture Boilerplate: اطلب من الذكاء الاصطناعي توليد الـ Layers دفعة واحدة للميزة (مثلاً: "Generate Clean Architecture setup for Task feature: Entity, Model, Repository, UseCase, and BLoC").

Firebase Service: اطلب منه كتابة FirestoreService تحوي CRUD كاملة جاهزة للنسخ.

UI Components: استخدم مكتبات جاهزة لتقليل بناء الـ Widgets يدوياً (مثلاً percent_indicator لشريط التقدم).

هل ترغب في البدء بتوليد مخطط Clean Architecture أو نماذج البيانات (Models) فوراً؟

نعم
اكتبي ملخص للمشروع و المتطلبات والواجهات المطلوبة وهيكلة المهمة وكلشي مطلوب في ملف واحد

Your PDF file is ready

رمز PDF
todo_project_specifications
 PDF 
📋 ملخص وثيقة مواصفات المشروع (Todo App - Clean Architecture & Firebase)
تم إعداد وثيقة متكاملة ومصممة خصيصاً لتناسب مهلتك (48 ساعة) مع التركيز على إبراز أفضل المهارات في الـ CV. إليك الملخص الشامل لكل ما يخص المشروع:

1. ملخص الفكرة والهدف
الهدف: بناء تطبيق إدارة مهام شخصية متكامل وعالي الجودة لإثبات كفاءتك في تقنيات Flutter, Firebase, BLoC, Clean Architecture لأصحاب العمل.

المدة: 48 ساعة (مقسمة بدقة على يومين).

القيمة الأساسية: الربط الكامل مع خدمات Firebase الأساسية (Auth, Firestore, Storage, FCM) مع تطبيق مفاهيم هندسة البرمجيات الحديثة.

2. المتطلبات التقنية والخدمات (Requirements)
المصادقة (Authentication):

البريد الإلكتروني وكلمة السر (Email & Password).

تسجيل الدخول بـ Google (Google Sign-In).

إدارة البروفايل ورفع صورة الشخصية إلى Firebase Storage.

إدارة المهام (Task CRUD):

إضافة/تعديل/حذف/قراءة: مزامنة لحظية (Real-time Stream) مع Cloud Firestore.

المهام الفرعية (Subtasks): قائمة مهام فرعية داخل المهمة الرئيسية مع خيار التحديد (isCompleted).

حساب نسبة الإنجاز (Progress Calculation):

شريط تقدم يحدد النسبة المئوية تلقائياً:

Progress=( 
إجمالي المهام الفرعية
عدد المهام الفرعية المنجزة
​
 )×100%
الأصناف والبحث والمظهر:

الأصناف (Categories): (عمل، منزل، تطوير شخصي، صحة...).

البحث والفلترة: تصفية لحظية بالكلمات المفتاحية والتصنيف.

الثيمات (Theme): دعم الوضع الفاتح والداكن (Light/Dark Theme).

الإشعارات (Notifications Strategy):

إشعارات محليّة (flutter_local_notifications): تذكير مجدول عند اقتراب وقت استحقاق المهمة (Due Date Reminder).

إشعارات سحابيّة (firebase_messaging FCM): استقبال الرسائل التحفيزية عبر Firebase Console لتقليل الحاجة لبناء Backend.

3. قائمة الواجهات المطلوبة (UI Screens)
واجهة الترحيب والدخول (Splash & Auth Screen): تسجيل الدخول وإنشاء حساب مع خيار Google Sign-In.

الواجهة الرئيسية (Home Dashboard Screen):

الشريط العلوي (صورة الملف الشخصي، البحث، زر تغيير الثيم).

شريط اختيار الأصناف (Category Selector).

كروت المهام المعروضة وشريط التقدم الخاص بكل مهمة.

زر الإضافة العائم (FAB).

نافذة/واجهة إضافة وتعديل المهمة (Add/Edit Task Sheet): إدخال العنوان، الوصف، إضافة المهام الفرعية، واختيار موعد التذكير.

واجهة الملف الشخصي (Profile Screen): عرض البيانات، رفع وتعديل صورة البروفايل، وتسجيل الخروج.

4. هيكلية المهمة والبيانات (Data Models)
أ. نموذج المهمة الفرعية (SubTask)
id: String

title: String

isCompleted: bool

ب. نموذج المهمة الرئيسية (Task)
id: String

userId: String

title: String

description: String?

category: String

subTasks: List

reminderDateTime: DateTime?

isCompleted: bool

progressPercentage: double (تُحسب ديناميكياً)

5. هيكلية المجلدات (Clean Architecture Structure)
Plaintext
lib/
├── core/                   # الثيم، الخدمات العامة، الأخطاء، المساعدات
├── features/
│   ├── auth/               # Data, Domain, Presentation (Email, Google, Profile)
│   ├── task/               # Data, Domain, Presentation (CRUD, Subtasks, Search)
│   └── notifications/      # Local Notifications & FCM Logic
└── main.dart
6. خطة الـ 48 ساعة الخاطفة (Timeline)
الفترة	المهام والإنجازات
اليوم 1 (الصباح)	إعداد هيكل Clean Architecture، ربط Firebase، بناء Auth (Email & Google) وواجهة الدخول.
اليوم 1 (المساء)	بناء Firestore Service، نماذج البيانات، BLoC CRUD، واجهة الإضافة وعرض المهام والتقدم.
اليوم 2 (الصباح)	ضبط الإشعارات المحلية (Local Reminders) وربط إشعارات Firebase (FCM).
اليوم 2 (المساء)	إضافة البحث والفلترة والثيمات، اختبار التطبيق، وتجهيز ملف README.md لـ GitHub.
تم حفظ الملف بصيغة PDF عالية الجودة وتنسيق جاهز للطباعة أو القراءة المباشرة.

صح انا هيك كلهم بالخطة المجانية مو؟؟

وبدي استخدم مكاتب:

Get it

BLoC flutter

Firebase...

Flutter screenutil

InternetConnectionChecker أو connectivity_plus

Flutter toast



وبدي استخدم

Dismissible

Dialogs

ويمكن ضيف

showTimePicker

showDatePicker

والبحث لح يكون محلي

أفضل أن يكون التعديل والإضافة من خلال dialogs وليس واجهة منفصلة

نعم، تماماً! كل التقنيات والخدمات المطلوبة تعمل بنسبة 100% ضمن الخطة المجانية (Spark Plan) في Firebase، ولن تحتاج لدفع أي سنت.   
PDF

إليك تفصيل الخطة المجانية للموارد التي ستستخدمها:

Firebase Authentication: مجاني وغير محدود للـ Email/Password و Google Sign-In.   
PDF

Cloud Firestore: يمنحك 50,000 عملية قراءة و 20,000 عملية كتابة/تعديل/حذف يومياً، وهو رقم ضخم جداً بالنسبة لتطبيق شخصي أو تجريبي للـ CV.   
PDF

Firebase Storage: يمنحك 5 جيجابايت مساحة تخزين و 1 جيجابايت نقل بيانات يومياً، وهي أكثر من كافية لرفع صور البروفايل.   
PDF

Firebase Cloud Messaging (FCM): مجاني بالكامل وبلا أي قيود على عدد الإشعارات.   
PDF

📦 اعتمادات الحزم (Dependencies) الجاهزة للنسخ
قائمة المكتبات ممتازة ومباشرة، وتم تحسين خيارات الـ Dialogs والـ Pickers لتسريع التطوير خلال الـ 48 ساعة:

YAML
dependencies:
  flutter:
    sdk: flutter

  # State Management & DI
  flutter_bloc: ^8.1.3
  get_it: ^7.6.0

  # Firebase Core & Services
  firebase_core: ^2.27.0
  firebase_auth: ^4.17.8
  google_sign_in: ^6.2.1
  cloud_firestore: ^4.15.8
  firebase_storage: ^11.6.9
  firebase_messaging: ^14.7.19

  # Local Notifications & Network
  flutter_local_notifications: ^17.0.0
  connectivity_plus: ^5.0.2

  # UI & Utilities
  flutter_screenutil: ^5.9.0
  fluttertoast: ^8.2.4
  shared_preferences: ^2.2.2
  percent_indicator: ^4.2.3 # ممتازة ومريحة لشريط التقدم
🛠️ تعديلات خطة العمل بناءً على تفضيلاتك الجديدة
1. اعتماد Dialogs للإضافة والتعديل بدلاً من واجهة منفصلة
الميزة: يوفر عليك بناء صفحة كاملة ورسومات تنقل (Navigation Routes)، مما يختصر ما يقارب 2 - 3 ساعات من العمل!

التنفيذ: يمكنك استخدام showModalBottomSheet أو showDialog مدمج مع SingleChildScrollView لتضمين:

حقول العنوان والوصف.

قائمة إدخال المهام الفرعية (Subtasks).

اختيار التصنيف (Category Dropdown/Chips).

تاريخ ووقت التذكير عبر showDatePicker و showTimePicker.

2. استخدام Dismissible للحذف التفاعلي
إضافة خاصية Swipe-to-Delete على كرت المهمة مع ظهور خلفية حمراء وأيقونة سلة المهملات.

إظهار SnackBar احترافي يحتوي على زر Undo (إلغاء الحذف) لإضافة لمسة احترافية جداً للـ CV.

3. البحث المحلي (Local Search)
يتم جلب المهام عبر Firestore Stream مرة واحدة، ثم تطبيق الفلترة بالـ Title أو الـ Category مباشرة داخل الـ BLoC State، مما يوفر عمليات القراءة في Firestore ويجعل البحث لحظياً وبدون أي تأخير (Zero Latency).

هل ننتقل الآن لتوليد كود الـ Models و Firestore Service الجاهزين للنسخ؟

نعم
رد ركز لي ملخص لانو بدي خلي باقي الفريق يشوفه منشان يبلشوا يساووا UI, UX

إليك ملخص تنفيذي مركز وموجه لمصممي الـ UI/UX والواجهات، مصمم ليتم مشاركته مع فريقك مباشرة للبدء في التصميم فوراً:

📌 دليل تصميم واجهات تطبيق إدارة المهام (UI/UX Brief)
الهدف من التطبيق: تطبيق إدارة مهام حديث، سريع، وبسيط وديناميكي (Todo App) يُبرز استخدام ميزات Firebase والمهام الفرعية وشريط التقدم.

🎨 الهوية البصرية والنظام العام (Design System & Theme)
دعم المظهرين (Theme): وضع فاتح (Light Mode) ووضع داكن (Dark Mode).

التجاوب (Responsiveness): استخدام أبعاد متناسبة مع الشاشات باستعمال flutter_screenutil.

العناصر التفاعلية: اعتماد Bottom Sheets / Dialogs للتفاعل المباشر دون تنقلات كثيرة.

📋 قائمة الواجهات المطلوبة (UI Screens & Components)
1. واجهة الدخول والإنشاء (Auth Screen)
العناصر الأساسية:

حقول البريد الإلكتروني وكلمة السر + زر تسجيل الدخول/الإنشاء.

زر برمز واصل لتسجيل الدخول بـ Google Sign-In.

خيار رفع صورة البروفايل عند إنشاء الحساب.

2. الواجهة الرئيسية (Home Dashboard Screen)
الشريط العلوي (App Bar):

صورة البروفايل الدائرية (تفتح صفحة البروفايل).

حقل/زر البحث المحلي (Local Search Bar).

زر تبديل الثيم (Light/Dark Switch).

شريط التصنيفات الأفقي (Category Tabs):

شرائح اختيار قابلة للتمرير الأفقي: الكل (All), عمل (Work), منزل (Home), تطوير شخصي (Personal), صحة (Health).

قائمة المهام (Tasks List View):

كرت المهمة (Task Card) ويحتوي على:

عنوان المهمة والتصنيف.

شريط التقدم (Progress Bar): يوضح نسبة الإنجاز (مثلاً: %75) بناءً على المهام الفرعية.

قائمة مختصرة بالمهام الفرعية قابلة للتعليم (Checkbox).

مؤشر موعد التذكير (Reminder Date/Time Icon).

سحب للحذف (Swipe-to-Delete): باستخدام Dismissible مع خلفية حمراء وأيقونة سلة مهملات، وإظهار SnackBar مؤقت يحتوي على زر Undo.

زر الإضافة العائم (FAB): زر يطفو أسفل الصفحة يفتح نافذة الإضافة.

3. نافذة إضافة / تعديل المهمة (Add/Edit Modal Bottom Sheet)
ملاحظة للـ UX: تُعرض كنافذة تنزلق من الأسفل (Modal Bottom Sheet / Dialog) وليس صفحة منفصلة.

المحتويات:

حقل عنوان المهمة ووصف اختياري.

قائمة منسدلة (Dropdown/Chips) لاختيار التصنيف.

خيار إضافة مهام فرعية dynamically (حقل نصي + زر إضافة +).

اختيار تاريخ ووقت التذكير (مُدمج مع showDatePicker و showTimePicker).

زر حفظ/تحديث.

4. واجهة الملف الشخصي (Profile Screen)
صورة البروفايل الحالية مع إمكانية الضغط لرفع صورة جديدة.

اسم المستخدم والبريد الإلكتروني.

زر تسجيل الخروج (Log Out).

⚙️ منطق واجهة المستخدم المعتمد (UX Behavior Rules)
نسبة التقدم: تُحسب تلقائياً في الواجهة تلقائياً:

Progress=( 
إجمالي المهام الفرعية
عدد المهام الفرعية المكتملة
​
 )×100%
البحث المحلي: تصفية القائمة المعروضة فوراً أثناء الكتابة في حقل البحث.

التنبيهات: استخدام Flutter Toast لإظهار رسائل النجاح أو الأخطاء السريعة.

هلا اكتبي ملف مارك دوان قواعد يجب لل ai اتباعها أثناء برمجة هذا التطبيق

إليك ملف ai_coding_rules.md جاهز للنسخ والاستخدام. يمكنك إضافته لمجلد المشروع أو توجيهه للذكاء الاصطناعي (مثل Cursor أو ChatGPT أو GitHub Copilot) للالتزام التام بقواعد وصلاحيات البرمجة الخاصة بتطبيقك.

Markdown
# 🤖 AI Coding Rules & Architectural Guidelines for Todo App

> **Project Target:** Flutter Todo Application  
> **Architecture:** Clean Architecture + BLoC Pattern  
> **Backend Services:** Firebase (Auth, Firestore, Storage, FCM)  
> **Deadline Horizon:** Fast-Track / 48-Hour Execution  

---

## 🎯 1. Core Principles & Philosophy
1. **Strict Clean Architecture:** Respect layer independence: `Data` -> `Domain` -> `Presentation`. Do not mix layers.
2. **BLoC State Management:** Use `flutter_bloc` exclusively for state management. Do not use `setState` in complex widgets or other state management solutions.
3. **No Redundant UI:** Avoid creating separate screens for operations where modal sheets or dialogs are specified.
4. **Fast-Track Efficiency:** Keep code clean, modular, but concise. Avoid unnecessary over-engineering that increases implementation time.

---

## 🏗️ 2. Clean Architecture Layer Guidelines

### A. Presentation Layer (`lib/features/[feature]/presentation/`)
- **UI Responsiveness:** Always use `flutter_screenutil` for dimensions (`.w`, `.h`, `.sp`, `.r`).
- **Widgets Isolation:** Break complex UI screens into smaller `StatelessWidget` private widgets.
- **Form Inputs & Dialogs:**
  - Create and Edit tasks **MUST** use `showModalBottomSheet` or `showDialog`.
  - Use `showDatePicker` and `showTimePicker` for reminder selections.
- **Dismissible Usage:** Use `Dismissible` widget for task deletion with background swipe styling and `SnackBar` with an Undo option.
- **User Feedback:** Use `Fluttertoast` for fast error/success messages.

### B. Domain Layer (`lib/features/[feature]/domain/`)
- Pure Dart code with **ZERO** framework (Flutter) or third-party dependencies.
- Define pure Entities and Repository Interfaces (Contracts).
- Keep Use Cases simple and focused on single operations (e.g., `GetTasksUseCase`, `CreateTaskUseCase`).

### C. Data Layer (`lib/features/[feature]/data/`)
- Define Models that extend Domain Entities with `fromJson` and `toJson` methods.
- Implement Data Sources (`FirestoreService`, `FirebaseAuthService`, etc.).
- Convert Data Source exceptions into domain Failures in the Repository implementation.

---

## 📦 3. Approved Dependencies & Packages
Only use the following approved packages:
- `flutter_bloc` & `get_it` (Dependency Injection & State Management)
- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, `firebase_messaging`
- `google_sign_in`
- `flutter_local_notifications`
- `connectivity_plus`
- `flutter_screenutil`
- `fluttertoast`
- `shared_preferences`
- `percent_indicator`

---

## 🗄️ 4. Data Structures & Math Requirements

### SubTask Model Structure
```dart
class SubTask {
  final String id;
  final String title;
  final bool isCompleted;
}
Task Model Structure & Progress Rule
Dart
class Task {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final String category;
  final List<SubTask> subTasks;
  final DateTime? reminderDateTime;
  final bool isCompleted;

  // Progress Calculation Rule:
  double get progressPercentage {
    if (subTasks.isEmpty) return isCompleted ? 1.0 : 0.0;
    final completedCount = subTasks.where((st) => st.isCompleted).length;
    return completedCount / subTasks.length;
  }
}
⚡ 5. Specific Feature Implementation Rules
Authentication:

Support both Email/Password and Google Sign-In.

User profile images must upload to Firebase Storage and return a download URL.

Search & Filtering:

Perform search locally inside the BLoC state over the fetched Firestore stream to save read operations and ensure zero latency.

Notifications:

Local Reminders: Schedule using flutter_local_notifications via reminderDateTime.

FCM: Handle FCM token acquisition and foreground/background message handlers.

Theme Management:

Implement ThemeBloc using shared_preferences to persist Light/Dark mode state.

🛑 6. Strict "DONTs" for AI Generator
❌ DO NOT generate separate full-screen routes for Task Create/Edit. Always use Dialogs/BottomSheets.

❌ DO NOT use setState() for global or feature-level state management.

❌ DO NOT hardcode UI dimensions; always wrap values with ScreenUtil methods.

❌ DO NOT perform Firestore network queries for search text filtering. Filter locally in BLoC.

# 🤖 AI Coding Rules & Architectural Guidelines for Todo App



> **Project Target:** Flutter Todo Application  

> **Architecture:** Clean Architecture + BLoC Pattern  

> **Backend Services:** Firebase (Auth, Firestore, Storage, FCM)  

> **Deadline Horizon:** Fast-Track / 48-Hour Execution  



---



## 🎯 1. Core Principles & Philosophy

1. **Strict Clean Architecture:** Respect layer independence: `Data` -> `Domain` -> `Presentation`. Do not mix layers.

2. **BLoC State Management:** Use `flutter_bloc` exclusively for state management. Do not use `setState` in complex widgets or other state management solutions.

3. **No Redundant UI:** Avoid creating separate screens for operations where modal sheets or dialogs are specified.

4. **Fast-Track Efficiency:** Keep code clean, modular, but concise. Avoid unnecessary over-engineering that increases implementation time.



---



## 🏗️ 2. Clean Architecture Layer Guidelines



### A. Presentation Layer (`lib/features/[feature]/presentation/`)

- **UI Responsiveness:** Always use `flutter_screenutil` for dimensions (`.w`, `.h`, `.sp`, `.r`).

- **Widgets Isolation:** Break complex UI screens into smaller `StatelessWidget` private widgets.

- **Form Inputs & Dialogs:**

  - Create and Edit tasks **MUST** use `showModalBottomSheet` or `showDialog`.

  - Use `showDatePicker` and `showTimePicker` for reminder selections.

- **Dismissible Usage:** Use `Dismissible` widget for task deletion with background swipe styling and `SnackBar` with an Undo option.

- **User Feedback:** Use `Fluttertoast` for fast error/success messages.



### B. Domain Layer (`lib/features/[feature]/domain/`)

- Pure Dart code with **ZERO** framework (Flutter) or third-party dependencies.

- Define pure Entities and Repository Interfaces (Contracts).

- Keep Use Cases simple and focused on single operations (e.g., `GetTasksUseCase`, `CreateTaskUseCase`).



### C. Data Layer (`lib/features/[feature]/data/`)

- Define Models that extend Domain Entities with `fromJson` and `toJson` methods.

- Implement Data Sources (`FirestoreService`, `FirebaseAuthService`, etc.).

- Convert Data Source exceptions into domain Failures in the Repository implementation.



---



## 📦 3. Approved Dependencies & Packages

Only use the following approved packages:

- `flutter_bloc` & `get_it` (Dependency Injection & State Management)

- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, `firebase_messaging`

- `google_sign_in`

- `flutter_local_notifications`

- `connectivity_plus`

- `flutter_screenutil`

- `fluttertoast`

- `shared_preferences`

- `percent_indicator`



---



## 🗄️ 4. Data Structures & Math Requirements



### SubTask Model Structure

```dart

class SubTask {

  final String id;

  final String title;

  final bool isCompleted;

}



بس هدلون حطهم بالملف؟؟

نعم، القواعد التي شاركتَها تغطي الهيكل العام بشكل ممتاز جداً!

لكن حتى يكون الملف كاملاً وقابلاً للتنفيذ مباشرة بواسطة الذكاء الاصطناعي دون أن يسألك عن تفاصيل ناقصة أو ينشئ أكواداً غير متوافقة، يفضل أن يتضمن الملف أيضاً تكملة النماذج (Models) وحقن الإسناد (GetIt) وإعدادات الإشعارات.

إليك الملف المكتمل والنهائي الذي يمكنك نسخه ووضعه مباشرة في ملف ai_coding_rules.md:

Markdown
# 🤖 AI Coding Rules & Architectural Guidelines for Todo App

> **Project Target:** Flutter Todo Application  
> **Architecture:** Clean Architecture + BLoC Pattern  
> **Backend Services:** Firebase (Auth, Firestore, Storage, FCM)  
> **Deadline Horizon:** Fast-Track / 48-Hour Execution  

---

## 🎯 1. Core Principles & Philosophy
1. **Strict Clean Architecture:** Respect layer independence: `Data` -> `Domain` -> `Presentation`. Do not mix layers.
2. **BLoC State Management:** Use `flutter_bloc` exclusively for state management. Do not use `setState` in complex widgets or state management alternatives.
3. **No Redundant UI:** Avoid creating separate screens for operations where modal sheets or dialogs are specified.
4. **Fast-Track Efficiency:** Keep code clean, modular, but concise. Avoid unnecessary over-engineering that increases implementation time.

---

## 🏗️ 2. Clean Architecture Layer Guidelines

### A. Presentation Layer (`lib/features/[feature]/presentation/`)
- **UI Responsiveness:** Always use `flutter_screenutil` for dimensions (`.w`, `.h`, `.sp`, `.r`).
- **Widgets Isolation:** Break complex UI screens into smaller `StatelessWidget` private widgets.
- **Form Inputs & Dialogs:**
  - Create and Edit tasks **MUST** use `showModalBottomSheet` or `showDialog`.
  - Use `showDatePicker` and `showTimePicker` for reminder selections.
- **Dismissible Usage:** Use `Dismissible` widget for task deletion with background swipe styling and `SnackBar` with an Undo option.
- **User Feedback:** Use `Fluttertoast` for fast error/success messages.

### B. Domain Layer (`lib/features/[feature]/domain/`)
- Pure Dart code with **ZERO** framework (Flutter) or third-party dependencies.
- Define pure Entities and Repository Interfaces (Contracts).
- Keep Use Cases simple and focused on single operations (e.g., `GetTasksUseCase`, `CreateTaskUseCase`).

### C. Data Layer (`lib/features/[feature]/data/`)
- Define Models that extend Domain Entities with `toMap` and `fromMap` / `fromJson` methods.
- Implement Data Sources (`FirestoreService`, `FirebaseAuthService`, etc.).
- Convert Data Source exceptions into domain Failures in the Repository implementation.

---

## 📦 3. Approved Dependencies & Packages
Only use the following approved packages:
- `flutter_bloc` & `get_it` (Dependency Injection & State Management)
- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, `firebase_messaging`
- `google_sign_in`
- `flutter_local_notifications`
- `connectivity_plus`
- `flutter_screenutil`
- `fluttertoast`
- `shared_preferences`
- `percent_indicator`

---

## 🗄️ 4. Complete Data Structures & Models

### A. SubTask Model
```dart
class SubTask {
  final String id;
  final String title;
  final bool isCompleted;

  SubTask({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'isCompleted': isCompleted,
  };

  factory SubTask.fromMap(Map<String, dynamic> map) => SubTask(
    id: map['id'] ?? '',
    title: map['title'] ?? '',
    isCompleted: map['isCompleted'] ?? false,
  );
}
B. Task Model & Progress Percentage Rule
Dart
class Task {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final String category; // 'Work', 'Home', 'Personal', 'Health', etc.
  final List<SubTask> subTasks;
  final DateTime? reminderDateTime;
  final bool isCompleted;

  Task({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.category,
    required this.subTasks,
    this.reminderDateTime,
    this.isCompleted = false,
  });

  // Dynamically calculated progress percentage (0.0 to 1.0)
  double get progressPercentage {
    if (subTasks.isEmpty) return isCompleted ? 1.0 : 0.0;
    final completedCount = subTasks.where((st) => st.isCompleted).length;
    return completedCount / subTasks.length;
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'userId': userId,
    'title': title,
    'description': description,
    'category': category,
    'subTasks': subTasks.map((x) => x.toMap()).toList(),
    'reminderDateTime': reminderDateTime?.toIso8601String(),
    'isCompleted': isCompleted,
  };

  factory Task.fromMap(Map<String, dynamic> map) => Task(
    id: map['id'] ?? '',
    userId: map['userId'] ?? '',
    title: map['title'] ?? '',
    description: map['description'],
    category: map['category'] ?? 'General',
    subTasks: List<SubTask>.from((map['subTasks'] ?? []).map((x) => SubTask.fromMap(x))),
    reminderDateTime: map['reminderDateTime'] != null ? DateTime.parse(map['reminderDateTime']) : null,
    isCompleted: map['isCompleted'] ?? false,
  );
}
⚡ 5. Specific Feature Implementation Rules
Dependency Injection Setup (sl / Service Locator):

Register all Repositories, Data Sources, Use Cases, and BLoCs using GetIt inside core/services/injection_container.dart.

Authentication:

Support both Email/Password and Google Sign-In.

User profile image uploads must route to Firebase Storage and update the Auth user profile URL.

Local Search & Filter:

Query Firestore for all tasks once using Streams.

Perform title search and category filtering locally inside the TaskBloc state to reduce Firestore read counts and ensure instant search results.

Notifications Logic:

Local Reminders: Schedule notifications using flutter_local_notifications using the task's reminderDateTime.

Cloud Messaging: Retrieve FCM tokens on auth and set up foreground/background messaging handlers.

Theme Switching:

Implement ThemeBloc using shared_preferences to persist Light/Dark mode state across app restarts.

🛑 6. Strict "DONTs" for AI Generator
❌ DO NOT generate separate full-screen routes for Task Create/Edit. Always use Dialogs or BottomSheets.

❌ DO NOT use setState() for global or feature-level state management.

❌ DO NOT hardcode UI dimensions; always wrap values with ScreenUtil methods (e.g., 16.w, 20.h, 14.sp).

❌ DO NOT perform Firestore network queries for search text filtering. Filter locally in BLoC.

⚡ 5. Specific Feature Implementation Rules

Dependency Injection Setup (sl / Service Locator):

Register all Repositories, Data Sources, Use Cases, and BLoCs using GetIt inside core/services/injection_container.dart.

Authentication:

Support both Email/Password and Google Sign-In.

User profile image uploads must route to Firebase Storage and update the Auth user profile URL.

Local Search & Filter:

Query Firestore for all tasks once using Streams.

Perform title search and category filtering locally inside the TaskBloc state to reduce Firestore read counts and ensure instant search results.

Notifications Logic:

Local Reminders: Schedule notifications using flutter_local_notifications using the task's reminderDateTime.

Cloud Messaging: Retrieve FCM tokens on auth and set up foreground/background messaging handlers.

Theme Switching:

Implement ThemeBloc using shared_preferences to persist Light/Dark mode state across app restarts.

🛑 6. Strict "DONTs" for AI Generator

❌ DO NOT generate separate full-screen routes for Task Create/Edit. Always use Dialogs or BottomSheets.

❌ DO NOT use setState() for global or feature-level state management.

❌ DO NOT hardcode UI dimensions; always wrap values with ScreenUtil methods (e.g., 16.w, 20.h, 14.sp).

❌ DO NOT perform Firestore network queries for search text filtering. Filter locally in BLoC.



هدلون انسخهم متل ما هنن ولا مت بصير حط هيك

نعم، انسخهم تماماً كما هُم باللغة الإنكليزية، بصير 100%!

المجاهرين والمحركات البرمجية للذكاء الاصطناعي (مثل Cursor، GitHub Copilot، ChatGPT، Claude) تقرأ وتفهم التعليمات التقنية وحظر الأخطاء (DONTs) بشكل أدق وأفضل بكثير عندما تكون مكتوبة باللغة الإنكليزية وبتنسيق Markdown.

السبب في ذلك أن المصطلحات التقنية وأسماء المكتبات مثل GetIt و ScreenUtil و BLoC و Firestore هي مصطلحات إنكليزية بالأصل، وكتابتها بنفس الصيغة تجعل الذكاء الاصطناعي يلتزم بها بحذافيرها دون أي التباس أو ترجمة خاطئة.

يمكنك نسخ الملف المكتمل الذي جهزناه لك بالأعلى واستخدامه مباشرة كملف ai_coding_rules.md في مشروعك.

هيك؟؟

Markdown

# 🤖 AI Coding Rules & Architectural Guidelines for Todo App



> **Project Target:** Flutter Todo Application  

> **Architecture:** Clean Architecture + BLoC Pattern  

> **Backend Services:** Firebase (Auth, Firestore, Storage, FCM)  

> **Deadline Horizon:** Fast-Track / 48-Hour Execution  



---



## 🎯 1. Core Principles & Philosophy

1. **Strict Clean Architecture:** Respect layer independence: `Data` -> `Domain` -> `Presentation`. Do not mix layers.

2. **BLoC State Management:** Use `flutter_bloc` exclusively for state management. Do not use `setState` in complex widgets or state management alternatives.

3. **No Redundant UI:** Avoid creating separate screens for operations where modal sheets or dialogs are specified.

4. **Fast-Track Efficiency:** Keep code clean, modular, but concise. Avoid unnecessary over-engineering that increases implementation time.



---



## 🏗️ 2. Clean Architecture Layer Guidelines



### A. Presentation Layer (`lib/features/[feature]/presentation/`)

- **UI Responsiveness:** Always use `flutter_screenutil` for dimensions (`.w`, `.h`, `.sp`, `.r`).

- **Widgets Isolation:** Break complex UI screens into smaller `StatelessWidget` private widgets.

- **Form Inputs & Dialogs:**

  - Create and Edit tasks **MUST** use `showModalBottomSheet` or `showDialog`.

  - Use `showDatePicker` and `showTimePicker` for reminder selections.

- **Dismissible Usage:** Use `Dismissible` widget for task deletion with background swipe styling and `SnackBar` with an Undo option.

- **User Feedback:** Use `Fluttertoast` for fast error/success messages.



### B. Domain Layer (`lib/features/[feature]/domain/`)

- Pure Dart code with **ZERO** framework (Flutter) or third-party dependencies.

- Define pure Entities and Repository Interfaces (Contracts).

- Keep Use Cases simple and focused on single operations (e.g., `GetTasksUseCase`, `CreateTaskUseCase`).



### C. Data Layer (`lib/features/[feature]/data/`)

- Define Models that extend Domain Entities with `toMap` and `fromMap` / `fromJson` methods.

- Implement Data Sources (`FirestoreService`, `FirebaseAuthService`, etc.).

- Convert Data Source exceptions into domain Failures in the Repository implementation.



---



## 📦 3. Approved Dependencies & Packages

Only use the following approved packages:

- `flutter_bloc` & `get_it` (Dependency Injection & State Management)

- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, `firebase_messaging`

- `google_sign_in`

- `flutter_local_notifications`

- `connectivity_plus`

- `flutter_screenutil`

- `fluttertoast`

- `shared_preferences`

- `percent_indicator`



---



## 🗄️ 4. Complete Data Structures & Models



### A. SubTask Model

```dart

class SubTask {

  final String id;

  final String title;

  final bool isCompleted;



  SubTask({

    required this.id,

    required this.title,

    this.isCompleted = false,

  });



  Map<String, dynamic> toMap() => {

    'id': id,

    'title': title,

    'isCompleted': isCompleted,

  };



  factory SubTask.fromMap(Map<String, dynamic> map) => SubTask(

    id: map['id'] ?? '',

    title: map['title'] ?? '',

    isCompleted: map['isCompleted'] ?? false,

  );

}

B. Task Model & Progress Percentage Rule

Dart

class Task {

  final String id;

  final String userId;

  final String title;

  final String? description;

  final String category; // 'Work', 'Home', 'Personal', 'Health', etc.

  final List<SubTask> subTasks;

  final DateTime? reminderDateTime;

  final bool isCompleted;



  Task({

    required this.id,

    required this.userId,

    required this.title,

    this.description,

    required this.category,

    required this.subTasks,

    this.reminderDateTime,

    this.isCompleted = false,

  });



  // Dynamically calculated progress percentage (0.0 to 1.0)

  double get progressPercentage {

    if (subTasks.isEmpty) return isCompleted ? 1.0 : 0.0;

    final completedCount = subTasks.where((st) => st.isCompleted).length;

    return completedCount / subTasks.length;

  }



  Map<String, dynamic> toMap() => {

    'id': id,

    'userId': userId,

    'title': title,

    'description': description,

    'category': category,

    'subTasks': subTasks.map((x) => x.toMap()).toList(),

    'reminderDateTime': reminderDateTime?.toIso8601String(),

    'isCompleted': isCompleted,

  };



  factory Task.fromMap(Map<String, dynamic> map) => Task(

    id: map['id'] ?? '',

    userId: map['userId'] ?? '',

    title: map['title'] ?? '',

    description: map['description'],

    category: map['category'] ?? 'General',

    subTasks: List<SubTask>.from((map['subTasks'] ?? []).map((x) => SubTask.fromMap(x))),

    reminderDateTime: map['reminderDateTime'] != null ? DateTime.parse(map['reminderDateTime']) : null,

    isCompleted: map['isCompleted'] ?? false,

  );

}

⚡ 5. Specific Feature Implementation Rules

Dependency Injection Setup (sl / Service Locator):



Register all Repositories, Data Sources, Use Cases, and BLoCs using GetIt inside core/services/injection_container.dart.



Authentication:



Support both Email/Password and Google Sign-In.



User profile image uploads must route to Firebase Storage and update the Auth user profile URL.



Local Search & Filter:



Query Firestore for all tasks once using Streams.



Perform title search and category filtering locally inside the TaskBloc state to reduce Firestore read counts and ensure instant search results.



Notifications Logic:



Local Reminders: Schedule notifications using flutter_local_notifications using the task's reminderDateTime.



Cloud Messaging: Retrieve FCM tokens on auth and set up foreground/background messaging handlers.



Theme Switching:



Implement ThemeBloc using shared_preferences to persist Light/Dark mode state across app restarts.



🛑 6. Strict "DONTs" for AI Generator

❌ DO NOT generate separate full-screen routes for Task Create/Edit. Always use Dialogs or BottomSheets.



❌ DO NOT use setState() for global or feature-level state management.



❌ DO NOT hardcode UI dimensions; always wrap values with ScreenUtil methods (e.g., 16.w, 20.h, 14.sp).



❌ DO NOT perform Firestore network queries for search text filtering. Filter locally in BLoC.Markdown

# 🤖 AI Coding Rules & Architectural Guidelines for Todo App



> **Project Target:** Flutter Todo Application  

> **Architecture:** Clean Architecture + BLoC Pattern  

> **Backend Services:** Firebase (Auth, Firestore, Storage, FCM)  

> **Deadline Horizon:** Fast-Track / 48-Hour Execution  



---



## 🎯 1. Core Principles & Philosophy

1. **Strict Clean Architecture:** Respect layer independence: `Data` -> `Domain` -> `Presentation`. Do not mix layers.

2. **BLoC State Management:** Use `flutter_bloc` exclusively for state management. Do not use `setState` in complex widgets or state management alternatives.

3. **No Redundant UI:** Avoid creating separate screens for operations where modal sheets or dialogs are specified.

4. **Fast-Track Efficiency:** Keep code clean, modular, but concise. Avoid unnecessary over-engineering that increases implementation time.



---



## 🏗️ 2. Clean Architecture Layer Guidelines



### A. Presentation Layer (`lib/features/[feature]/presentation/`)

- **UI Responsiveness:** Always use `flutter_screenutil` for dimensions (`.w`, `.h`, `.sp`, `.r`).

- **Widgets Isolation:** Break complex UI screens into smaller `StatelessWidget` private widgets.

- **Form Inputs & Dialogs:**

  - Create and Edit tasks **MUST** use `showModalBottomSheet` or `showDialog`.

  - Use `showDatePicker` and `showTimePicker` for reminder selections.

- **Dismissible Usage:** Use `Dismissible` widget for task deletion with background swipe styling and `SnackBar` with an Undo option.

- **User Feedback:** Use `Fluttertoast` for fast error/success messages.



### B. Domain Layer (`lib/features/[feature]/domain/`)

- Pure Dart code with **ZERO** framework (Flutter) or third-party dependencies.

- Define pure Entities and Repository Interfaces (Contracts).

- Keep Use Cases simple and focused on single operations (e.g., `GetTasksUseCase`, `CreateTaskUseCase`).



### C. Data Layer (`lib/features/[feature]/data/`)

- Define Models that extend Domain Entities with `toMap` and `fromMap` / `fromJson` methods.

- Implement Data Sources (`FirestoreService`, `FirebaseAuthService`, etc.).

- Convert Data Source exceptions into domain Failures in the Repository implementation.



---



## 📦 3. Approved Dependencies & Packages

Only use the following approved packages:

- `flutter_bloc` & `get_it` (Dependency Injection & State Management)

- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, `firebase_messaging`

- `google_sign_in`

- `flutter_local_notifications`

- `connectivity_plus`

- `flutter_screenutil`

- `fluttertoast`

- `shared_preferences`

- `percent_indicator`



---



## 🗄️ 4. Complete Data Structures & Models



### A. SubTask Model

```dart

class SubTask {

  final String id;

  final String title;

  final bool isCompleted;



  SubTask({

    required this.id,

    required this.title,

    this.isCompleted = false,

  });



  Map<String, dynamic> toMap() => {

    'id': id,

    'title': title,

    'isCompleted': isCompleted,

  };



  factory SubTask.fromMap(Map<String, dynamic> map) => SubTask(

    id: map['id'] ?? '',

    title: map['title'] ?? '',

    isCompleted: map['isCompleted'] ?? false,

  );

}

B. Task Model & Progress Percentage Rule

Dart

class Task {

  final String id;

  final String userId;

  final String title;

  final String? description;

  final String category; // 'Work', 'Home', 'Personal', 'Health', etc.

  final List<SubTask> subTasks;

  final DateTime? reminderDateTime;

  final bool isCompleted;



  Task({

    required this.id,

    required this.userId,

    required this.title,

    this.description,

    required this.category,

    required this.subTasks,

    this.reminderDateTime,

    this.isCompleted = false,

  });



  // Dynamically calculated progress percentage (0.0 to 1.0)

  double get progressPercentage {

    if (subTasks.isEmpty) return isCompleted ? 1.0 : 0.0;

    final completedCount = subTasks.where((st) => st.isCompleted).length;

    return completedCount / subTasks.length;

  }



  Map<String, dynamic> toMap() => {

    'id': id,

    'userId': userId,

    'title': title,

    'description': description,

    'category': category,

    'subTasks': subTasks.map((x) => x.toMap()).toList(),

    'reminderDateTime': reminderDateTime?.toIso8601String(),

    'isCompleted': isCompleted,

  };



  factory Task.fromMap(Map<String, dynamic> map) => Task(

    id: map['id'] ?? '',

    userId: map['userId'] ?? '',

    title: map['title'] ?? '',

    description: map['description'],

    category: map['category'] ?? 'General',

    subTasks: List<SubTask>.from((map['subTasks'] ?? []).map((x) => SubTask.fromMap(x))),

    reminderDateTime: map['reminderDateTime'] != null ? DateTime.parse(map['reminderDateTime']) : null,

    isCompleted: map['isCompleted'] ?? false,

  );

}

⚡ 5. Specific Feature Implementation Rules

Dependency Injection Setup (sl / Service Locator):



Register all Repositories, Data Sources, Use Cases, and BLoCs using GetIt inside core/services/injection_container.dart.



Authentication:



Support both Email/Password and Google Sign-In.



User profile image uploads must route to Firebase Storage and update the Auth user profile URL.



Local Search & Filter:



Query Firestore for all tasks once using Streams.



Perform title search and category filtering locally inside the TaskBloc state to reduce Firestore read counts and ensure instant search results.



Notifications Logic:



Local Reminders: Schedule notifications using flutter_local_notifications using the task's reminderDateTime.



Cloud Messaging: Retrieve FCM tokens on auth and set up foreground/background messaging handlers.



Theme Switching:



Implement ThemeBloc using shared_preferences to persist Light/Dark mode state across app restarts.



🛑 6. Strict "DONTs" for AI Generator

❌ DO NOT generate separate full-screen routes for Task Create/Edit. Always use Dialogs or BottomSheets.



❌ DO NOT use setState() for global or feature-level state management.



❌ DO NOT hardcode UI dimensions; always wrap values with ScreenUtil methods (e.g., 16.w, 20.h, 14.sp).



❌ DO NOT perform Firestore network queries for search text filtering. Filter locally in BLoC.Markdown

# 🤖 AI Coding Rules & Architectural Guidelines for Todo App



> **Project Target:** Flutter Todo Application  

> **Architecture:** Clean Architecture + BLoC Pattern  

> **Backend Services:** Firebase (Auth, Firestore, Storage, FCM)  

> **Deadline Horizon:** Fast-Track / 48-Hour Execution  



---



## 🎯 1. Core Principles & Philosophy

1. **Strict Clean Architecture:** Respect layer independence: `Data` -> `Domain` -> `Presentation`. Do not mix layers.

2. **BLoC State Management:** Use `flutter_bloc` exclusively for state management. Do not use `setState` in complex widgets or state management alternatives.

3. **No Redundant UI:** Avoid creating separate screens for operations where modal sheets or dialogs are specified.

4. **Fast-Track Efficiency:** Keep code clean, modular, but concise. Avoid unnecessary over-engineering that increases implementation time.



---



## 🏗️ 2. Clean Architecture Layer Guidelines



### A. Presentation Layer (`lib/features/[feature]/presentation/`)

- **UI Responsiveness:** Always use `flutter_screenutil` for dimensions (`.w`, `.h`, `.sp`, `.r`).

- **Widgets Isolation:** Break complex UI screens into smaller `StatelessWidget` private widgets.

- **Form Inputs & Dialogs:**

  - Create and Edit tasks **MUST** use `showModalBottomSheet` or `showDialog`.

  - Use `showDatePicker` and `showTimePicker` for reminder selections.

- **Dismissible Usage:** Use `Dismissible` widget for task deletion with background swipe styling and `SnackBar` with an Undo option.

- **User Feedback:** Use `Fluttertoast` for fast error/success messages.



### B. Domain Layer (`lib/features/[feature]/domain/`)

- Pure Dart code with **ZERO** framework (Flutter) or third-party dependencies.

- Define pure Entities and Repository Interfaces (Contracts).

- Keep Use Cases simple and focused on single operations (e.g., `GetTasksUseCase`, `CreateTaskUseCase`).



### C. Data Layer (`lib/features/[feature]/data/`)

- Define Models that extend Domain Entities with `toMap` and `fromMap` / `fromJson` methods.

- Implement Data Sources (`FirestoreService`, `FirebaseAuthService`, etc.).

- Convert Data Source exceptions into domain Failures in the Repository implementation.



---



## 📦 3. Approved Dependencies & Packages

Only use the following approved packages:

- `flutter_bloc` & `get_it` (Dependency Injection & State Management)

- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, `firebase_messaging`

- `google_sign_in`

- `flutter_local_notifications`

- `connectivity_plus`

- `flutter_screenutil`

- `fluttertoast`

- `shared_preferences`

- `percent_indicator`



---



## 🗄️ 4. Complete Data Structures & Models



### A. SubTask Model

```dart

class SubTask {

  final String id;

  final String title;

  final bool isCompleted;



  SubTask({

    required this.id,

    required this.title,

    this.isCompleted = false,

  });



  Map<String, dynamic> toMap() => {

    'id': id,

    'title': title,

    'isCompleted': isCompleted,

  };



  factory SubTask.fromMap(Map<String, dynamic> map) => SubTask(

    id: map['id'] ?? '',

    title: map['title'] ?? '',

    isCompleted: map['isCompleted'] ?? false,

  );

}

B. Task Model & Progress Percentage Rule

Dart

class Task {

  final String id;

  final String userId;

  final String title;

  final String? description;

  final String category; // 'Work', 'Home', 'Personal', 'Health', etc.

  final List<SubTask> subTasks;

  final DateTime? reminderDateTime;

  final bool isCompleted;



  Task({

    required this.id,

    required this.userId,

    required this.title,

    this.description,

    required this.category,

    required this.subTasks,

    this.reminderDateTime,

    this.isCompleted = false,

  });



  // Dynamically calculated progress percentage (0.0 to 1.0)

  double get progressPercentage {

    if (subTasks.isEmpty) return isCompleted ? 1.0 : 0.0;

    final completedCount = subTasks.where((st) => st.isCompleted).length;

    return completedCount / subTasks.length;

  }



  Map<String, dynamic> toMap() => {

    'id': id,

    'userId': userId,

    'title': title,

    'description': description,

    'category': category,

    'subTasks': subTasks.map((x) => x.toMap()).toList(),

    'reminderDateTime': reminderDateTime?.toIso8601String(),

    'isCompleted': isCompleted,

  };



  factory Task.fromMap(Map<String, dynamic> map) => Task(

    id: map['id'] ?? '',

    userId: map['userId'] ?? '',

    title: map['title'] ?? '',

    description: map['description'],

    category: map['category'] ?? 'General',

    subTasks: List<SubTask>.from((map['subTasks'] ?? []).map((x) => SubTask.fromMap(x))),

    reminderDateTime: map['reminderDateTime'] != null ? DateTime.parse(map['reminderDateTime']) : null,

    isCompleted: map['isCompleted'] ?? false,

  );

}

⚡ 5. Specific Feature Implementation Rules

Dependency Injection Setup (sl / Service Locator):



Register all Repositories, Data Sources, Use Cases, and BLoCs using GetIt inside core/services/injection_container.dart.



Authentication:



Support both Email/Password and Google Sign-In.



User profile image uploads must route to Firebase Storage and update the Auth user profile URL.



Local Search & Filter:



Query Firestore for all tasks once using Streams.



Perform title search and category filtering locally inside the TaskBloc state to reduce Firestore read counts and ensure instant search results.



Notifications Logic:



Local Reminders: Schedule notifications using flutter_local_notifications using the task's reminderDateTime.



Cloud Messaging: Retrieve FCM tokens on auth and set up foreground/background messaging handlers.



Theme Switching:



Implement ThemeBloc using shared_preferences to persist Light/Dark mode state across app restarts.



🛑 6. Strict "DONTs" for AI Generator

❌ DO NOT generate separate full-screen routes for Task Create/Edit. Always use Dialogs or BottomSheets.



❌ DO NOT use setState() for global or feature-level state management.



❌ DO NOT hardcode UI dimensions; always wrap values with ScreenUtil methods (e.g., 16.w, 20.h, 14.sp).



❌ DO NOT perform Firestore network queries for search text filtering. Filter locally in BLoC.



حاسه في اشارات ناقصه متل #

ملاحظتك في مكانها تماماً! النص تكرر مع اللصق وضاعت بعض رموز الـ Markdown (مثل أوسمة الأكواد ``` والعناوين #).

إليك النص المصحح والمغلق بشكل كامل ونظيف 100%. انسخ الكود الموجود داخل الصندوق أدناه واحفظه في ملف باسم ai_coding_rules.md:

Markdown
# 🤖 AI Coding Rules & Architectural Guidelines for Todo App

> **Project Target:** Flutter Todo Application
> **Architecture:** Clean Architecture + BLoC Pattern
> **Backend Services:** Firebase (Auth, Firestore, Storage, FCM)
> **Deadline Horizon:** Fast-Track / 48-Hour Execution

---

## 🎯 1. Core Principles & Philosophy
1. **Strict Clean Architecture:** Respect layer independence: `Data` -> `Domain` -> `Presentation`. Do not mix layers.
2. **BLoC State Management:** Use `flutter_bloc` exclusively for state management. Do not use `setState` in complex widgets or state management alternatives.
3. **No Redundant UI:** Avoid creating separate screens for operations where modal sheets or dialogs are specified.
4. **Fast-Track Efficiency:** Keep code clean, modular, but concise. Avoid unnecessary over-engineering that increases implementation time.

---

## 🏗️ 2. Clean Architecture Layer Guidelines

### A. Presentation Layer (`lib/features/[feature]/presentation/`)
- **UI Responsiveness:** Always use `flutter_screenutil` for dimensions (`.w`, `.h`, `.sp`, `.r`).
- **Widgets Isolation:** Break complex UI screens into smaller `StatelessWidget` private widgets.
- **Form Inputs & Dialogs:**
  - Create and Edit tasks **MUST** use `showModalBottomSheet` or `showDialog`.
  - Use `showDatePicker` and `showTimePicker` for reminder selections.
- **Dismissible Usage:** Use `Dismissible` widget for task deletion with background swipe styling and `SnackBar` with an Undo option.
- **User Feedback:** Use `Fluttertoast` for fast error/success messages.

### B. Domain Layer (`lib/features/[feature]/domain/`)
- Pure Dart code with **ZERO** framework (Flutter) or third-party dependencies.
- Define pure Entities and Repository Interfaces (Contracts).
- Keep Use Cases simple and focused on single operations (e.g., `GetTasksUseCase`, `CreateTaskUseCase`).

### C. Data Layer (`lib/features/[feature]/data/`)
- Define Models that extend Domain Entities with `toMap` and `fromMap` / `fromJson` methods.
- Implement Data Sources (`FirestoreService`, `FirebaseAuthService`, etc.).
- Convert Data Source exceptions into domain Failures in the Repository implementation.

---

## 📦 3. Approved Dependencies & Packages
Only use the following approved packages:
- `flutter_bloc` & `get_it` (Dependency Injection & State Management)
- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, `firebase_messaging`
- `google_sign_in`
- `flutter_local_notifications`
- `connectivity_plus`
- `flutter_screenutil`
- `fluttertoast`
- `shared_preferences`
- `percent_indicator`

---

## 🗄️ 4. Complete Data Structures & Models

### A. SubTask Model
```dart
class SubTask {
  final String id;
  final String title;
  final bool isCompleted;

  SubTask({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'isCompleted': isCompleted,
  };

  factory SubTask.fromMap(Map<String, dynamic> map) => SubTask(
    id: map['id'] ?? '',
    title: map['title'] ?? '',
    isCompleted: map['isCompleted'] ?? false,
  );
}
B. Task Model & Progress Percentage Rule
Dart
class Task {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final String category; // 'Work', 'Home', 'Personal', 'Health', etc.
  final List<SubTask> subTasks;
  final DateTime? reminderDateTime;
  final bool isCompleted;

  Task({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.category,
    required this.subTasks,
    this.reminderDateTime,
    this.isCompleted = false,
  });

  // Dynamically calculated progress percentage (0.0 to 1.0)
  double get progressPercentage {
    if (subTasks.isEmpty) return isCompleted ? 1.0 : 0.0;
    final completedCount = subTasks.where((st) => st.isCompleted).length;
    return completedCount / subTasks.length;
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'userId': userId,
    'title': title,
    'description': description,
    'category': category,
    'subTasks': subTasks.map((x) => x.toMap()).toList(),
    'reminderDateTime': reminderDateTime?.toIso8601String(),
    'isCompleted': isCompleted,
  };

  factory Task.fromMap(Map<String, dynamic> map) => Task(
    id: map['id'] ?? '',
    userId: map['userId'] ?? '',
    title: map['title'] ?? '',
    description: map['description'],
    category: map['category'] ?? 'General',
    subTasks: List<SubTask>.from((map['subTasks'] ?? []).map((x) => SubTask.fromMap(x))),
    reminderDateTime: map['reminderDateTime'] != null ? DateTime.parse(map['reminderDateTime']) : null,
    isCompleted: map['isCompleted'] ?? false,
  );
}
⚡ 5. Specific Feature Implementation Rules
Dependency Injection Setup (sl / Service Locator):
Register all Repositories, Data Sources, Use Cases, and BLoCs using GetIt inside core/services/injection_container.dart.

Authentication:
Support both Email/Password and Google Sign-In.

User profile image uploads must route to Firebase Storage and update the Auth user profile URL.

Local Search & Filter:
Query Firestore for all tasks once using Streams.

Perform title search and category filtering locally inside the TaskBloc state to reduce Firestore read counts and ensure instant search results.

Notifications Logic:
Local Reminders: Schedule notifications using flutter_local_notifications using the task's reminderDateTime.

Cloud Messaging: Retrieve FCM tokens on auth and set up foreground/background messaging handlers.

Theme Switching:
Implement ThemeBloc using shared_preferences to persist Light/Dark mode state across app restarts.

🛑 6. Strict "DONTs" for AI Generator
❌ DO NOT generate separate full-screen routes for Task Create/Edit. Always use Dialogs or BottomSheets.

❌ DO NOT use setState() for global or feature-level state management.

❌ DO NOT hardcode UI dimensions; always wrap values with ScreenUtil methods (e.g., 16.w, 20.h, 14.sp).

❌ DO NOT perform Firestore network queries for search text filtering. Filter locally in BLoC.


الآن الملف جاهز ومكتمل تماماً وبدون أي تكرار أو تنسيق مفقود.
ابعتلي ياه ملف md وانا بنسخه

يمكنك تحميل الملف جاهزاً بصيغة ai_coding_rules.md مباشرةً عبر الرابط أدناه:

[file-tag: code-generated-file-3bb1f0c2-5503-4927-aaef-e3aa713429fa]

📄 محتوى الملف (للنسخ السريع):
Markdown
# 🤖 AI Coding Rules & Architectural Guidelines for Todo App

> **Project Target:** Flutter Todo Application
> **Architecture:** Clean Architecture + BLoC Pattern
> **Backend Services:** Firebase (Auth, Firestore, Storage, FCM)
> **Deadline Horizon:** Fast-Track / 48-Hour Execution

---

## 🎯 1. Core Principles & Philosophy
1. **Strict Clean Architecture:** Respect layer independence: `Data` -> `Domain` -> `Presentation`. Do not mix layers.
2. **BLoC State Management:** Use `flutter_bloc` exclusively for state management. Do not use `setState` in complex widgets or state management alternatives.
3. **No Redundant UI:** Avoid creating separate screens for operations where modal sheets or dialogs are specified.
4. **Fast-Track Efficiency:** Keep code clean, modular, but concise. Avoid unnecessary over-engineering that increases implementation time.

---

## 🏗️ 2. Clean Architecture Layer Guidelines

### A. Presentation Layer (`lib/features/[feature]/presentation/`)
- **UI Responsiveness:** Always use `flutter_screenutil` for dimensions (`.w`, `.h`, `.sp`, `.r`).
- **Widgets Isolation:** Break complex UI screens into smaller `StatelessWidget` private widgets.
- **Form Inputs & Dialogs:**
  - Create and Edit tasks **MUST** use `showModalBottomSheet` or `showDialog`.
  - Use `showDatePicker` and `showTimePicker` for reminder selections.
- **Dismissible Usage:** Use `Dismissible` widget for task deletion with background swipe styling and `SnackBar` with an Undo option.
- **User Feedback:** Use `Fluttertoast` for fast error/success messages.

### B. Domain Layer (`lib/features/[feature]/domain/`)
- Pure Dart code with **ZERO** framework (Flutter) or third-party dependencies.
- Define pure Entities and Repository Interfaces (Contracts).
- Keep Use Cases simple and focused on single operations (e.g., `GetTasksUseCase`, `CreateTaskUseCase`).

### C. Data Layer (`lib/features/[feature]/data/`)
- Define Models that extend Domain Entities with `toMap` and `fromMap` / `fromJson` methods.
- Implement Data Sources (`FirestoreService`, `FirebaseAuthService`, etc.).
- Convert Data Source exceptions into domain Failures in the Repository implementation.

---

## 📦 3. Approved Dependencies & Packages
Only use the following approved packages:
- `flutter_bloc` & `get_it` (Dependency Injection & State Management)
- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, `firebase_messaging`
- `google_sign_in`
- `flutter_local_notifications`
- `connectivity_plus`
- `flutter_screenutil`
- `fluttertoast`
- `shared_preferences`
- `percent_indicator`

---

## 🗄️ 4. Complete Data Structures & Models

### A. SubTask Model
```dart
class SubTask {
  final String id;
  final String title;
  final bool isCompleted;

  SubTask({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'isCompleted': isCompleted,
  };

  factory SubTask.fromMap(Map<String, dynamic> map) => SubTask(
    id: map['id'] ?? '',
    title: map['title'] ?? '',
    isCompleted: map['isCompleted'] ?? false,
  );
}
B. Task Model & Progress Percentage Rule
Dart
class Task {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final String category; // 'Work', 'Home', 'Personal', 'Health', etc.
  final List<SubTask> subTasks;
  final DateTime? reminderDateTime;
  final bool isCompleted;

  Task({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.category,
    required this.subTasks,
    this.reminderDateTime,
    this.isCompleted = false,
  });

  // Dynamically calculated progress percentage (0.0 to 1.0)
  double get progressPercentage {
    if (subTasks.isEmpty) return isCompleted ? 1.0 : 0.0;
    final completedCount = subTasks.where((st) => st.isCompleted).length;
    return completedCount / subTasks.length;
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'userId': userId,
    'title': title,
    'description': description,
    'category': category,
    'subTasks': subTasks.map((x) => x.toMap()).toList(),
    'reminderDateTime': reminderDateTime?.toIso8601String(),
    'isCompleted': isCompleted,
  };

  factory Task.fromMap(Map<String, dynamic> map) => Task(
    id: map['id'] ?? '',
    userId: map['userId'] ?? '',
    title: map['title'] ?? '',
    description: map['description'],
    category: map['category'] ?? 'General',
    subTasks: List<SubTask>.from((map['subTasks'] ?? []).map((x) => SubTask.fromMap(x))),
    reminderDateTime: map['reminderDateTime'] != null ? DateTime.parse(map['reminderDateTime']) : null,
    isCompleted: map['isCompleted'] ?? false,
  );
}
⚡ 5. Specific Feature Implementation Rules
Dependency Injection Setup (sl / Service Locator):
Register all Repositories, Data Sources, Use Cases, and BLoCs using GetIt inside core/services/injection_container.dart.

Authentication:
Support both Email/Password and Google Sign-In.

User profile image uploads must route to Firebase Storage and update the Auth user profile URL.

Local Search & Filter:
Query Firestore for all tasks once using Streams.

Perform title search and category filtering locally inside the TaskBloc state to reduce Firestore read counts and ensure instant search results.

Notifications Logic:
Local Reminders: Schedule notifications using flutter_local_notifications using the task's reminderDateTime.

Cloud Messaging: Retrieve FCM tokens on auth and set up foreground/background messaging handlers.

Theme Switching:
Implement ThemeBloc using shared_preferences to persist Light/Dark mode state across app restarts.

🛑 6. Strict "DONTs" for AI Generator
❌ DO NOT generate separate full-screen routes for Task Create/Edit. Always use Dialogs or BottomSheets.

❌ DO NOT use setState() for global or feature-level state management.

❌ DO NOT hardcode UI dimensions; always wrap values with ScreenUtil methods (e.g., 16.w, 20.h, 14.sp).

❌ DO NOT perform Firestore network queries for search text filtering. Filter locally in BLoC.

قلتلك ابعته ملف لانو انت عندك من B. Task Model & Progress Percentage Rule ما عم تكتبه صح عم تنقص شغلات فيه

B. Task Model & Progress Percentage Rule
Dart
class Task {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final String category; // 'Work', 'Home', 'Personal', 'Health', etc.
  final List<SubTask> subTasks;
  final DateTime? reminderDateTime;
  final bool isCompleted;

  Task({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.category,
    required this.subTasks,
    this.reminderDateTime,
    this.isCompleted = false,
  });

  // Dynamically calculated progress percentage (0.0 to 1.0)
  double get progressPercentage {
    if (subTasks.isEmpty) return isCompleted ? 1.0 : 0.0;
    final completedCount = subTasks.where((st) => st.isCompleted).length;
    return completedCount / subTasks.length;
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'userId': userId,
    'title': title,
    'description': description,
    'category': category,
    'subTasks': subTasks.map((x) => x.toMap()).toList(),
    'reminderDateTime': reminderDateTime?.toIso8601String(),
    'isCompleted': isCompleted,
  };

  factory Task.fromMap(Map<String, dynamic> map) => Task(
    id: map['id'] ?? '',
    userId: map['userId'] ?? '',
    title: map['title'] ?? '',
    description: map['description'],
    category: map['category'] ?? 'General',
    subTasks: List<SubTask>.from((map['subTasks'] ?? []).map((x) => SubTask.fromMap(x))),
    reminderDateTime: map['reminderDateTime'] != null ? DateTime.parse(map['reminderDateTime']) : null,
    isCompleted: map['isCompleted'] ?? false,
  );
}
⚡ 5. Specific Feature Implementation Rules
Dependency Injection Setup (sl / Service Locator):
Register all Repositories, Data Sources, Use Cases, and BLoCs using GetIt inside core/services/injection_container.dart.

Authentication:
Support both Email/Password and Google Sign-In.

User profile image uploads must route to Firebase Storage and update the Auth user profile URL.

Local Search & Filter:
Query Firestore for all tasks once using Streams.

Perform title search and category filtering locally inside the TaskBloc state to reduce Firestore read counts and ensure instant search results.

Notifications Logic:
Local Reminders: Schedule notifications using flutter_local_notifications using the task's reminderDateTime.

Cloud Messaging: Retrieve FCM tokens on auth and set up foreground/background messaging handlers.

Theme Switching:
Implement ThemeBloc using shared_preferences to persist Light/Dark mode state across app restarts.

🛑 6. Strict "DONTs" for AI Generator
❌ DO NOT generate separate full-screen routes for Task Create/Edit. Always use Dialogs or BottomSheets.

❌ DO NOT use setState() for global or feature-level state management.

❌ DO NOT hardcode UI dimensions; always wrap values with ScreenUtil methods (e.g., 16.w, 20.h, 14.sp).

❌ DO NOT perform Firestore network queries for search text filtering. Filter locally in BLoC.
"""

with open("ai_coding_rules.md", "w", encoding="utf-8") as f:
f.write(md_content)

print("Markdown file created successfully.")


```text?code_stdout&code_event_index=1
Markdown file created successfully.

حقك علي، اعتذر منك على الخطأ التنسيقي السابق أثناء النسخ والمحاذاة.

لقد قمت بتوليد الملف بشكل كامل ودقيق جداً وبدون أي تنقيص أو أخطاء في الـ Markdown. يمكنك تحميل الملف مباشرةً بحجمه الكامل من الرابط أدناه:

رمز MD
ai_coding_rules
 MD 
الملف الآن يحتوي على كود Task Model و Progress Percentage Rule مع جميع الوسوم والتنسيقات الصحيحة 100%.




‫Gemini هو نموذج ذكاء اصطناعي وقد يعرض معلومات خاطئة، بما فيها تلك المتعلقة بالأشخاص. خصوصيتك على Geminiيفتح الرابط في نافذة جديدة.

جارٍ تحليل البيانات
# 🤖 AI Coding Rules & Architectural Guidelines for Todo App

> **Project Target:** Flutter Todo Application
> **Architecture:** Clean Architecture + BLoC Pattern
> **Backend Services:** Firebase (Auth, Firestore, Storage, FCM)
> **Deadline Horizon:** Fast-Track / 48-Hour Execution

---

## 🎯 1. Core Principles & Philosophy
1. **Strict Clean Architecture:** Respect layer independence: `Data` -> `Domain` -> `Presentation`. Do not mix layers.
2. **BLoC State Management:** Use `flutter_bloc` exclusively for state management. Do not use `setState` in complex widgets or state management alternatives.
3. **No Redundant UI:** Avoid creating separate screens for operations where modal sheets or dialogs are specified.
4. **Fast-Track Efficiency:** Keep code clean, modular, but concise. Avoid unnecessary over-engineering that increases implementation time.

---

## 🏗️ 2. Clean Architecture Layer Guidelines

### A. Presentation Layer (`lib/features/[feature]/presentation/`)
- **UI Responsiveness:** Always use `flutter_screenutil` for dimensions (`.w`, `.h`, `.sp`, `.r`).
- **Widgets Isolation:** Break complex UI screens into smaller `StatelessWidget` private widgets.
- **Form Inputs & Dialogs:**
  - Create and Edit tasks **MUST** use `showModalBottomSheet` or `showDialog`.
  - Use `showDatePicker` and `showTimePicker` for reminder selections.
- **Dismissible Usage:** Use `Dismissible` widget for task deletion with background swipe styling and `SnackBar` with an Undo option.
- **User Feedback:** Use `Fluttertoast` for fast error/success messages.

### B. Domain Layer (`lib/features/[feature]/domain/`)
- Pure Dart code with **ZERO** framework (Flutter) or third-party dependencies.
- Define pure Entities and Repository Interfaces (Contracts).
- Keep Use Cases simple and focused on single operations (e.g., `GetTasksUseCase`, `CreateTaskUseCase`).

### C. Data Layer (`lib/features/[feature]/data/`)
- Define Models that extend Domain Entities with `toMap` and `fromMap` / `fromJson` methods.
- Implement Data Sources (`FirestoreService`, `FirebaseAuthService`, etc.).
- Convert Data Source exceptions into domain Failures in the Repository implementation.

---

## 📦 3. Approved Dependencies & Packages
Only use the following approved packages:
- `flutter_bloc` & `get_it` (Dependency Injection & State Management)
- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, `firebase_messaging`
- `google_sign_in`
- `flutter_local_notifications`
- `connectivity_plus`
- `flutter_screenutil`
- `fluttertoast`
- `shared_preferences`
- `percent_indicator`

---

## 🗄️ 4. Complete Data Structures & Models

### A. SubTask Model
```dart
class SubTask {
  final String id;
  final String title;
  final bool isCompleted;

  SubTask({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'isCompleted': isCompleted,
  };

  factory SubTask.fromMap(Map<String, dynamic> map) => SubTask(
    id: map['id'] ?? '',
    title: map['title'] ?? '',
    isCompleted: map['isCompleted'] ?? false,
  );
}
```

### B. Task Model & Progress Percentage Rule
```dart
class Task {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final String category; // 'Work', 'Home', 'Personal', 'Health', etc.
  final List<SubTask> subTasks;
  final DateTime? reminderDateTime;
  final bool isCompleted;

  Task({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.category,
    required this.subTasks,
    this.reminderDateTime,
    this.isCompleted = false,
  });

  // Dynamically calculated progress percentage (0.0 to 1.0)
  double get progressPercentage {
    if (subTasks.isEmpty) return isCompleted ? 1.0 : 0.0;
    final completedCount = subTasks.where((st) => st.isCompleted).length;
    return completedCount / subTasks.length;
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'userId': userId,
    'title': title,
    'description': description,
    'category': category,
    'subTasks': subTasks.map((x) => x.toMap()).toList(),
    'reminderDateTime': reminderDateTime?.toIso8601String(),
    'isCompleted': isCompleted,
  };

  factory Task.fromMap(Map<String, dynamic> map) => Task(
    id: map['id'] ?? '',
    userId: map['userId'] ?? '',
    title: map['title'] ?? '',
    description: map['description'],
    category: map['category'] ?? 'General',
    subTasks: List<SubTask>.from((map['subTasks'] ?? []).map((x) => SubTask.fromMap(x))),
    reminderDateTime: map['reminderDateTime'] != null ? DateTime.parse(map['reminderDateTime']) : null,
    isCompleted: map['isCompleted'] ?? false,
  );
}
```

---

## ⚡ 5. Specific Feature Implementation Rules

### Dependency Injection Setup (`sl` / Service Locator):
- Register all Repositories, Data Sources, Use Cases, and BLoCs using `GetIt` inside `core/services/injection_container.dart`.

### Authentication:
- Support both Email/Password and Google Sign-In.
- User profile image uploads must route to Firebase Storage and update the Auth user profile URL.

### Local Search & Filter:
- Query Firestore for all tasks once using Streams.
- Perform title search and category filtering locally inside the TaskBloc state to reduce Firestore read counts and ensure instant search results.

### Notifications Logic:
- **Local Reminders:** Schedule notifications using `flutter_local_notifications` using the task's `reminderDateTime`.
- **Cloud Messaging:** Retrieve FCM tokens on auth and set up foreground/background messaging handlers.

### Theme Switching:
- Implement `ThemeBloc` using `shared_preferences` to persist Light/Dark mode state across app restarts.

---

## 🛑 6. Strict "DONTs" for AI Generator
- ❌ **DO NOT** generate separate full-screen routes for Task Create/Edit. Always use Dialogs or BottomSheets.
- ❌ **DO NOT** use `setState()` for global or feature-level state management.
- ❌ **DO NOT** hardcode UI dimensions; always wrap values with ScreenUtil methods (e.g., `16.w`, `20.h`, `14.sp`).
- ❌ **DO NOT** perform Firestore network queries for search text filtering. Filter locally in BLoC.
