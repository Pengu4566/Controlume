# Controlume

This is a Windows app for remote controlling the Resolume Arena software suite through Open Sound Control (OSC) over a WiFi connection. It is based on proto-oscpack by Alexandre Quessy (https://github.com/mapmapteam/proto-qtoscpack). 

This project aims to bring a fully custom interface for my dj and play style while retaining the openness and versatility of the transmission medium (allowing me to choose from any of the software that supports it). Currently I have built the program in qt5 and am using a Microsoft Surface Pro 4 as the main testing device. the touch functionality offers some useful benefits over controlling with just a mouse such as multiple input simultaneously and intuitive touch controls.

Features:
- dynamic connection (no manual linking needed!) between broadcaster(s) and listener, potentially allowing for multiple instances of this software sending commands to a single instance of Resolume
-  3 layer + master controls for opacity, rotation, volume, and clip shuffling/prev/next
- speed controls for master channel
- (coming soon) master volume control
- (coming soon) beat syncing and BPM controls


![controlume main screen](/1.PNG)

[![Alt text](https://img.youtube.com/vi/hk-JKrs0rrc/0.jpg)](https://www.youtube.com/watch?v=hk-JKrs0rrc)


## Introduction to OSC

From the OSC website ([http://opensoundcontrol.org](http://opensoundcontrol.org/)):

> Open Sound Control (OSC) is a protocol for communication among computers, sound synthesizers, and other multimedia devices that is optimized for modern networking technology. Bringing the benefits of modern networking technology to the world of electronic musical instruments, OSC's advantages include interoperability, accuracy, flexibility, and enhanced organization and documentation.
> This simple yet powerful protocol provides everything needed for real-time control of sound and other media processing while remaining flexible and easy to implement.
> ### Features:
> -   Open-ended, dynamic, URL-style symbolic naming scheme
> -   Symbolic and high-resolution numeric argument data
> -   Pattern matching language to specify multiple recipients of a single message
> -   High resolution time tags
> -   "Bundles" of messages whose effects must occur simultaneously
> -   Query system to dynamically find out the capabilities of an OSC server and get documentation"
