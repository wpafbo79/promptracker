# PrompTracker

![image](logo.png "Logo generated using InvokeAI Stable Diffusion using the following prompt: 'Create a logo for PrompTracker that represents the creativity and innovation of AI art' as suggested by ChatGPT.  Negative prompt: 'out of frame, split frame, cropped, duplicate, ugly, mutated, deformed, blurry, watermark, text, logo, oversaturated, high contrast, overexposed'  Model: stable-diffusion-2.1-768  Steps: 25  CFG: 7.5  Width: 768  Height: 768  Sampler: k_euler  Seed: 190820033  Noise Threshold: 0  Perlin Noise: 0")

PrompTracker is an app for studying prompts and models used in generating AI art. It displays images and metadata from a directory of images created with Stable Diffusion, including images generated with img2img.

Developed by ChatGPT. Designed and managed by [@wpafbo79](https://github.com/wpafbo79).

## Features

PrompTracker includes the following features:

* Display all images in a directory
* Sort images by creation date
* Display metadata about each image, stored in similarly named YAML files
* Display placeholder if an image is not available but metadata is
* Tree-like layout for img2img images, with connections to their source image
* Filter images by any metadata field
* Filter prompts by token or similarity score

## Installation

To install PrompTracker, follow these steps:

1. Clone this repository to your local machine.
1. Install the latest version of Flutter.
1. Run the following command in the project directory to install dependencies:
```
flutter pub get
```
4. Connect your device to your computer or set up an emulator.
1. Run the following command to launch the app:
```
flutter run
```

## Usage

Once you have launched PrompTracker, follow these steps to use it:

1. Choose a directory containing images and metadata files created with Stable Diffusion.
1. PrompTracker will display all images in the directory, with metadata displayed alongside each image.
1. To filter images by a metadata field, tap the Filter button and select the desired field and filter value.
1. To filter prompts by token or similarity score, tap the Prompts button and select the desired filter.

## License

PrompTracker is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.
