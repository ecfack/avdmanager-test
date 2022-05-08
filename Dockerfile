FROM appium/appium:v1.22.3-p0
WORKDIR /root
ENV API_LEVEL=27 \
    IMG_TYPE=google_apis \
    SYS_IMG=x86 \
    PATH=${PATH}:${ANDROID_HOME}/build-tools
COPY ./devices.xml /root/.android/devices.xml
RUN yes | sdkmanager --licenses && \
    sdkmanager "platforms;android-${API_LEVEL}" "system-images;android-${API_LEVEL};${IMG_TYPE};${SYS_IMG}" "emulator"
CMD /bin/sh