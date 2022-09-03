# DragonRuby VR Tracking

An example app for headset and controller tracking by DragonRuby VR.

https://user-images.githubusercontent.com/213169/188268909-9e455507-d3f0-49a4-8de0-5c3dbbd03390.mp4

## Requirements

- [DragonRuby Game Toolkit Pro + VR](https://dragonruby.org/toolkit/game)

## Install to Oculus Quest 2

```
$ cd path/to/dragonruby-macos
$ cp -r path/to/dragonruby_vr_tracking .

$ keytool -genkey -v -keystore mygame.keystore \
  -alias mygame -keyalg RSA \
  -keysize 2048 -validity 10000
 
$ ./dragonruby-publish --only-package dragonruby_vr_tracking && \
  apksigner sign --ks mygame.keystore --ks-pass pass:password builds/dragonruby_vr_tracking-oculusquest.apk && \
  adb install builds/dragonruby_vr_tracking-oculusquest.apk 
```

## License

MIT

## Author

[@tnantoka](https://twitter.com/tnantoka)