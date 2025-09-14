# hvcc NTS-1 mkII Examples

This repository provides Pure Data patches for [hvcc_nts1mkii](https://github.com/boochow/hvcc_nts1mkii).

## How to Use

If you want to try the pre-built samples, download the binaries from the Releases page.

To build or modify patches yourself, follow these steps:

1. **Install Prerequisites:**  
   Install hvcc, the logue SDK, and [hvcc_nts1mkii](https://github.com/boochow/hvcc_nts1mkii).

2. **Clone the Repository:**  
   Copy this repository to your local machine:
   ```bash
   git clone https://github.com/boochow/nts1mkii_hvcc_examples
   cd nts1mkii_hvcc_examples
   ```

3. **Edit the Makefile:**  
   Edit the `Makefile` so that PLATFORMDIR points to your logue SDK installation:
   ```
   PLATFORMDIR ?= $(HOME)/logue-sdk/platform
   ```
4. **Build the Units:**  
   To build all units, run:
   ```bash
   make
   ```
   
5. **Build a specific unit (optional):**
   The Pure Data patches are located in the `pd/` directory. To build one, specify the patch name without its extension:
   
   ```bash
   make Sync
   ```

## Patch Descriptions

### Oscillator

- **Sync.pd** 
  Synced sine wave oscillator.
- **Detune.pd** 
  Two sine oscillators with slightly different frequencies.
- **Draw.pd** 
  Hand-drawn waveform oscillator.
- **PitchShift.pd** 
  Shifts the pitch of the AUX IN signal.
- **7ch-Vocoder.pd**
  7-band vocoder. Connect the modulator (voice) signal to AUX IN.

To enable AUX IN for oscillator units, hold the REVERB button and turn NTS-1 mkII on, then set the `Inr.` value to `0`. Press ARP to save and restart.

**Additional oscillator patches**: More patches are available at [boochow/loguesdk\_hvcc\_examples](https://github.com/boochow/loguesdk_hvcc_examples)

### Modulation FX

- **SampHold.pd** 
  Resamples the input at 400 Hz–16 kHz.
- **BitCrush.pd**
  Reduces quantization bit depth.
- **Ring.pd** 
  Ring modulation with a sine wave.
- **ChangeVol.pd**
  Input volume control.
- **Cosine.pd**
  Cosine waveshaper.

### Delay FX

- **Echo.pd** 
  Simple echo effect.
- **MonoDelay.pd** 
  Mono delay with low-pass filter.
- **Chorus.pd** 
  Mono chorus.
- **Comb.pd** 
  Comb filter.
- **FreqShift.pd** 
  Frequency shifter (`[hv.freqshift~]` in `heavylib`).

### Reverb FX

Due to size limitations, implementing true reverb effects in Pure Data is difficult, so this section provides various effects instead.

- **StereoDelay.pd** 
  Ping-pong delay with low-pass filter.
- **StereoChorus.pd** 
  Stereo version of `Chorus.pd`.
- **Reflection.pd** 
  A pair of short delays with different times.
- **Canceller.pd**
  Adds the phase-inverted signal from the opposite channel (vocal canceller).
- **Comp.pd** 
  Compressor (`[hv.compressor~]` in `heavylib`).
