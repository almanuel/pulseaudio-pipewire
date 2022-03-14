#!/bin/bash

# Ubuntu 20.04

# Based on https://atish3604.medium.com/solved-bluetooth-headset-mic-not-working-detected-in-ubuntu-20-04-86a5236444d0

# Install 
# echo "Install"
# sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream
# sudo apt update
# sudo apt install pipewire libspa-0.2-bluetooth pipewire-audio-client-libraries

# Systemctl
echo "Systemctl"
systemctl --user daemon-reload
systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user --now enable pipewire pipewire-pulse
systemctl --user mask pulseaudio
systemctl --user --now enable pipewire-media-session.service
systemctl --user restart pipewire
pactl info

# # Rollback
# echo "Rollback"
# systemctl --user unmask pulseaudio
# systemctl --user --now enable pulseaudio.service pulseaudio.socket
# pactl info
