#
# Copyright (C) 2010 The Android Open Source Project
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Makefile for producing abyss sdk coverage reports.
# Run "make abyss-sdk-test-coverage" in the $ANDROID_BUILD_TOP directory.

abyss_sdk_api_coverage_exe := $(HOST_OUT_EXECUTABLES)/abyss-sdk-api-coverage
dexdeps_exe := $(HOST_OUT_EXECUTABLES)/dexdeps

coverage_out := $(HOST_OUT)/abyss-sdk-api-coverage

api_text_description := abyss-sdk/api/abyss_current.txt
api_xml_description := $(coverage_out)/api.xml
$(api_xml_description) : $(api_text_description) $(APICHECK)
	$(hide) echo "Converting API file to XML: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) $(APICHECK_COMMAND) -convert2xml $< $@

abyss-sdk-test-coverage-report := $(coverage_out)/abyss-sdk-test-coverage.html

abyss_sdk_tests_apk := $(call intermediates-dir-for,APPS,AbyssPlatformTests)/package.apk
abysssettingsprovider_tests_apk := $(call intermediates-dir-for,APPS,AbyssSettingsProviderTests)/package.apk
abyss_sdk_api_coverage_dependencies := $(abyss_sdk_api_coverage_exe) $(dexdeps_exe) $(api_xml_description)

$(abyss-sdk-test-coverage-report): PRIVATE_TEST_CASES := $(abyss_sdk_tests_apk) $(abysssettingsprovider_tests_apk)
$(abyss-sdk-test-coverage-report): PRIVATE_ABYSS_SDK_API_COVERAGE_EXE := $(abyss_sdk_api_coverage_exe)
$(abyss-sdk-test-coverage-report): PRIVATE_DEXDEPS_EXE := $(dexdeps_exe)
$(abyss-sdk-test-coverage-report): PRIVATE_API_XML_DESC := $(api_xml_description)
$(abyss-sdk-test-coverage-report): $(abyss_sdk_tests_apk) $(abysssettingsprovider_tests_apk) $(abyss_sdk_api_coverage_dependencies) | $(ACP)
	$(call generate-abyss-coverage-report,"ABYSS-SDK API Coverage Report",\
			$(PRIVATE_TEST_CASES),html)

.PHONY: abyss-sdk-test-coverage
abyss-sdk-test-coverage : $(abyss-sdk-test-coverage-report)

# Put the test coverage report in the dist dir if "abyss-sdk" is among the build goals.
ifneq ($(filter abyss-sdk, $(MAKECMDGOALS)),)
  $(call dist-for-goals, abyss-sdk, $(abyss-sdk-test-coverage-report):abyss-sdk-test-coverage-report.html)
endif

# Arguments;
#  1 - Name of the report printed out on the screen
#  2 - List of apk files that will be scanned to generate the report
#  3 - Format of the report
define generate-abyss-coverage-report
	$(hide) mkdir -p $(dir $@)
	$(hide) $(PRIVATE_ABYSS_SDK_API_COVERAGE_EXE) -d $(PRIVATE_DEXDEPS_EXE) -a $(PRIVATE_API_XML_DESC) -f $(3) -o $@ $(2) -cm
	@ echo $(1): file://$@
endef

# Reset temp vars
abyss_sdk_api_coverage_dependencies :=
abyss-sdk-combined-coverage-report :=
abyss-sdk-combined-xml-coverage-report :=
abyss-sdk-verifier-coverage-report :=
abyss-sdk-test-coverage-report :=
api_xml_description :=
api_text_description :=
coverage_out :=
dexdeps_exe :=
abyss_sdk_api_coverage_exe :=
abyss_sdk_verifier_apk :=
android_abyss_sdk_zip :=
