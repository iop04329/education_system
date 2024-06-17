all: clean ipa aab apk

release: clean archive aab

archive:
	flutter build ipa

ipa:
	flutter build ipa --export-options-plist=ExportOptions.plist

apk:
	flutter build apk

aab:
	flutter build appbundle

clean:
	flutter clean

pub:
	flutter clean
	flutter pub get

runner:
	dart run build_runner build --delete-conflicting-outputs


APK = build/app/outputs/flutter-apk/app-release.apk
AAB = build/app/outputs/bundle/release/app-release.aab
IPA = build/ios/ipa/*.ipa
XCARCHIVE = build/ios/archive/Runner.xcarchive

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

targetRoot = ~/Documents/$(current_dir)
targetFolder = $(targetRoot)/$$(date +%Y%m%d%H%M)

move:
#	- rm -rf $(targetRoot)/*
	- mkdir -p $(targetRoot)
	- mkdir -p $(targetFolder)
	- sleep 3
ifneq (,$(wildcard $(APK)))
	- mv $(APK) $(targetFolder)/app.apk
endif
ifneq (,$(wildcard $(AAB)))
	- mv $(AAB) $(targetFolder)/app.aab
endif
ifneq (,$(wildcard $(IPA)))
	- mv $(IPA) $(targetFolder)/app.ipa
endif
ifneq (,$(wildcard $(XCARCHIVE)))
	- mv $(XCARCHIVE) $(targetFolder)/Runner.xcarchive
endif
