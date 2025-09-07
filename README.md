# hvcc NTS-1 mkII Examples

This repository contains Pure Data patches written for [hvcc_nts1mkii](https://github.com/boochow/hvcc_nts1mkii).

## How to Use

If you want to try the pre-built samples, download the binaries from the Releases page.

If you want to modify the patches yourself, follow these steps:

1. **Install Prerequisites:**  
   Install hvcc, logue SDK, and [hvcc_nts1mkii](https://github.com/boochow/hvcc_nts1mkii).

2. **Clone the Repository:**  
   Copy this repository to your local machine:
   ```bash
   git clone https://github.com/boochow/nts1mkii_hvcc_examples
   cd nts1mkii_hvcc_examples
   ```

3. **Edit the Makefile:**  
   Open the Makefile and modify the following line to match the path where your logue SDK is located:
   ```
   PLATFORMDIR ?= $(HOME)/logue-sdk/platform
   ```

4. **Build the Units:**  
   To build all units, run:
   
   ```bash
   make
   ```
   
5. **Build A Specific Unit (Optional):**  
   The Pure Data patches are located in the `pd/` directory. You can build a specific patch by specifying its name without file extension. For example:
   
   ```bash
   make Sync
   ```

## Patch Descriptions

### Oscillator

- **Sync.pd** 
  Sync'ed sine wave oscillator.
- **Detune.pd** 
  Two sine wave oscillators with slightly different frequency.
- **MixAUX.pd** 
  A simple sawtooth oscillator using `[phasor~]` is mixed with the sound from AUX IN.
- **Draw.pd** 
  A hand-draw waveform oscillator.
- **7ch_Vocoder.pd** 
  7-band channel vocoder.

**NOTE**: More oscillator patches are available at [boochow/loguesdk\_hvcc\_examples](https://github.com/boochow/loguesdk_hvcc_examples)

### Modulation FX

- **SampHold.pd** 
  Resample the input sound in low sampling frequency (400 Hz-16 KHz).
- **BitCrush.pd**
  Change sampling quantization bit depth.
- **Ring.pd** 
  Ring modulation with sine wave.
- **ChangeVol.pd**
  Change the input sound volume.
- **Cosine.pd**
  Waveshaper with cosine function.

### Delay FX

- **Echo.pd** 
  Simple echo back effect.
- **MonoDelay.pd** 
  Single channel delay with low pass filter.
- **Chorus.pd** 
  Single channel chorus.
- **Comb.pd** 
  Comb filter.
- **FreqShift.pd** 
  Frequency shifter using `[hv.freqshift~]`in `heavylib`.

### Reverb FX

- **StereoDelay.pd** 
  Stereo version of `MonoDelay.pd`.
- **StereoChorus.pd** 
  Stereo version of `Chorus.pd`.
- **Reflection.pd** 
  A pair of short delay with different delay time.
- **Rings.pd** 
  Stereo version of `Ring.pd`.
- **Comp.pd** 
  Compressor using `[hv.compressor~]`in `heavylib`.
