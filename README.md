# SberiOSSchool
For homework 

отличия Trunk-based development от feature-подхода

###Feature Branch Workflow 

Основная идея данного подхода заключается в том, что есть основная ветка master, в которой хранится вся история проекта. Если разработчик хочет внести какие-то он создаёт отдельную ветку feature и уже в ней работает над задачей. Названия веток feature должны быть понятными, то есть должны давать представление о том, что разрабатывается на ветке. После того как работа над задачей законченна, ветка feature должна быть отправлена в master. Это позволяет дать доступ к функциональности другим разработчикам, не затрагивая официальный код. Так как master – единственная “особая” ветка, сохранение нескольких веток feature в центральном репозитории не вызывает проблем. И конечно, это удобно для отката локальных изменений.

####Ключевые идеи Feature Branch Workflow 

+Она ориентирована на шаблоны ветвления.
+Может быть использована вместе с другими моделями работы с репозиториями.
+Способствует общению в команде посредством запросов на объединение и ревью кода.

###Trunk-based development

В отличие от Feature Branch Workflow, в Trunk-based development основная идея заключается в том, что ветка master всегда готова к деплою, даже если есть недописанные фичи. Такую возможность предоставляет наличие Feature Flags, через который мы можем включать и выключать фичи. 
Но главное отличие, что у нас просто нету ветки feature, все изменения мы делаем ветки на изменение одной абстракции, что позволяет нам декомпозировать одну большую задачу на много маленьких

####Ключевые идеи Trunk-based development

+ Все ветки, кроме master, живут максимум 2 дня, что позволяет проводить частые короткие итерации 
+ Feature Flags, которые дают нам возможность деплоить код, который ещё не готов, а так же шарить код между недоработанными фичами.
+ Continuous Review. При внесении маленьких изменений в абстракцию, мы сразу же делаем pull request. Поскольку у нас pull requests очень маленькие, они изменяют только маленький кусочек кода. И у нас review занимает пару минут.
