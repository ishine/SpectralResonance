# LuaJIT-Analysis
Analysis

# Spectral Audio Signal Processing
* https://ccrma.stanford.edu/~jos/sasp/

# Spectral Descriptors
* https://www.mathworks.com/help/audio/ug/spectral-descriptors.html
* https://user.it.uu.se/~ps/SAS-new.pdf

# Theories
* http://telit.etf.rs/download/An%20Introduction%20to%20Audio%20Content%20Analysis.pdf
* https://www.academia.edu/25584816/AUDIO_ANALYSIS_Introduction_to
* https://www.cs.cmu.edu/~gtzan/work/pubs/thesis02gtzan.pdf
* https://www.klingbeil.com/data/Klingbeil_Dissertation_web.pdf
* https://cran.r-project.org/web/packages/seewave/vignettes/seewave_analysis.pdf
* https://www.eumus.edu.uy/eme/ensenanza/electivas/dsp/presentaciones/PhaseVocoderTutorial.pdf
* http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.437.9723&rep=rep1&type=pdf
* https://arxiv.org/pdf/1811.01222.pdf
* https://www.ntnu.edu/documents/1001201110/1266017954/DAFx-15_submission_43_v2.pdf
* http://ijciras.com/PublishedPaper/IJCIRAS1582.pdf
* https://www.ijitee.org/wp-content/uploads/papers/v8i7c2/G10460587C219.pdf
* https://fau.digital.flvc.org/islandora/object/fau%3A3410/datastream/OBJ/download/Model-based_classification_of_speech_audio.pdf

# Phase Vocoder
* https://composersdesktop.com/pdf/phasevocoder.pdf
* https://www.eumus.edu.uy/eme/ensenanza/electivas/dsp/presentaciones/PhaseVocoderTutorial.pdf
* https://www.ee.columbia.edu/~dpwe/papers/LaroD99-pvoc.pdf
* https://quod.lib.umich.edu/cgi/p/pod/dod-idx/sliding-phase-vocoder.pdf?c=icmc;idno=bbp2372.2007.198;format=pdf
* http://pfister.ee.duke.edu/courses/ece485/filterbank.pdf
* https://www.di.ens.fr/~mallat/papiers/Vocoder.pdf
* http://www.mp3-tech.org/programmer/docs//roebel_transients.pdf
* http://academics.wellesley.edu/Physics/brown/pubs/pvocWmiller00661475.pdf
* http://musicweb.ucsd.edu/~sdubnov/Mu172/Lectures/STFTXsynth.pdf

# What use is FFT?
* It has alot of uses despite nobody explins it very well
* It computes the fourier transform of a signal fast
* Faster than a discrete fourier transform 
* Most signals are made up of sine waves (at least, that is the fourier theory)
* Fourier theory assume the signal is periodic and continous but it is not always true
* They invent special algorithms like wavelets but they aren't really important for audio dsp much
* The FFT computes a vector of real or complex samples and creates a vector of complex bins
* The bins measure the energy around the frequency of each band
* You can think of an FFT like a filter bank it will give you the energy of the sine waves in the signal at each frequency bin
* It doesn't remove anything out unless you modify it
* YOu can compute the inverse fft which will take the complex frequency bins and turn them back into samples
* In the FFT you are in the frequency domain, not the time domain
* The bins all measure steps in the frequency and give you the energy and phase of each sine wave

# Things you can do with an FFT
* You can synthesize sounds with an FFT
* you can use it to do signal source seperation
* You can remove inharmonic content and noise
* You can filter but setting things to zero can result in ringing 
* You can measure the energy of each sine wave and use it to control things
* You can multiply spectrum togethor, which does not always sound good
* You can compute a spectral envelope like a window on the frequencies that may not sound very good
* You can interpolate spectrums and morph them resultign in peculiar sounds
* You can use the spectrum with machine learning to control synthesizers and all kinds of things
* The FFT is used in speech synthesis and recognition
* The spectrogram is a sliding window computed with the FFT using an STFT
* It is just a matrix or array of the spectrum at each hop
* You can compute the entire spectrum of a file using DFT or FFT but it is not always what you want to do
* FFT is usually restricted to power of 2, if your data doesn't fit make the size the next power of 2 and put zeros in it
* Then remember to get rid of those extra zeros when you're done

# Using the FFT
* FFT can be used for convolution, correlation, and autocorrelation
* Convolution is used to make fir filter and reverb
* correlation and autocorrelation are used in algorithms like linear predictive coding
* You can use FFT to make resampler filters and to change sample rate

# Spectral Descriptors
* They are statistical maths of the FFT bins
* They aren't particularly useful by themselves
* They are used to compare things and to measure similairty to other things 
* They are used in machine learning, music information and speech recognition
* You can get them by calculating them or using a feature extraction tool to do it for you


# FFT is like  matrix multiply
* But the matrix is a diagonal and you can multiply the vector with it
* You can do these algorithms with a matrix but I don't know the right way to do it
