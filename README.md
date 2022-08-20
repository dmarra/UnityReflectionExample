# Unity Reflection Example

A demo of reflections in unity using Projectors and RenderTextures. This is meant to demonstrate how one can leverage these assets to create cool reflection effects with minimal effort. The use case for this is the scenario where you want to project _geometry_ onto a surface, and not simply a decal. 

For a more detailed explanation about the how and why (and a live demo!), read my post about this:

[https://danieljmarra.com/reflections-in-unity/](https://danieljmarra.com/reflections-in-unity/ "https://danieljmarra.com/reflections-in-unity/")

## TL;DR:

[![Runtime Preview Video](https://raw.githubusercontent.com/dmarra/UnityReflectionExample/master/Docs/Assets/Images/runtime_preview.gif "Runtime Preview Video")](https://raw.githubusercontent.com/dmarra/UnityReflectionExample/master/Docs/Assets/Images/runtime_preview.gif "Runtime Preview Video")

## Building

This has been tested on the following platforms:

- Windows 10
- WebGL

The current settings are configured for Windows, but if you switch the build target, some assets will rebuilt. 

### Requirements

- Unity >= v2022.1.13

### Instructions

Note: these are for the Windows build (the default in this project). For specific instructions for different platforms, see the next section

1. Clone project
2. Open folder with the required Unity version
	- Note: you can try other versions. this project is pretty simple, so I would be surprised if it is difficult to get it working, although I am not sure if this is backward compatible. I may add some tags to make it easier to open for some earlier versions of Unity. 
3. Build like you would any other Unity project:
	1. File -> Build
	2. Select a build location. I normally create a Build folder locally and build there. 
	3. Build and Run!


### Platform Specific

Some platforms require a few changes to the build settings

#### WebGL

Before you build and run:

1. Navigate to "Player Settings..."
2. In the "Player" section, under the "Publishing Settings" subsection, make sure the following values are set as such:
	- "Compression Format": Gzip
	- "Decompression Fallback": checked

[![WebGL Settings Screenshot](https://raw.githubusercontent.com/dmarra/UnityReflectionExample/master/Docs/Assets/Images/webgl_settings_1.png "WebGL Settings Screenshot")](https://raw.githubusercontent.com/dmarra/UnityReflectionExample/master/Docs/Assets/Images/webgl_settings_1.png "WebGL Settings Screenshot")


## Questions

I love answering questions! Please dont be shy.

## Liscence
C\'mon now, this is a demo... Do whatever you want with it. I couldn\'t care less! Just have fun, and keep learning!