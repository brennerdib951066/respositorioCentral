#!/usr/bin/env bash

urlGoogle="https://web.telegram.org/k/"

google-chrome-stable --profile-directory='Profile 1' "${urlGoogle}" &>- &
