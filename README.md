# flutter_workload_mobile

### Configure flutter:
```
$ flutter channel stable
$ flutter upgrade
$ flutter doctor
```

### Run:
select any mobile device as a target device in your IDE
or:
```
$ flutter run -d chrome


### Build for release:
```
$ flutter build web
```

### Deploy:
If it's first time, follow (this tutorial)[https://medium.com/flutter/must-try-use-firebase-to-host-your-flutter-app-on-the-web-852ee533a469], except one thing:
- when such dialog appears, enter **n**, not **y** (deny it):
```
Configure as a single-page app (rewrite all urls to /index.html)? (y/n)
```
Then you can use just
```
$ flutter build web
$ firebase login (if not logged in)
$ firebase deploy
```
