#!/usr/bin/env python

# Copyright (C) 2006-2021  Music Technology Group - Universitat Pompeu Fabra
#
# This file is part of Essentia
#
# Essentia is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation (FSF), either version 3 of the License, or (at your
# option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the Affero GNU General Public License
# version 3 along with this program. If not, see http://www.gnu.org/licenses/



from essentia_test import *
from essentia.streaming import MonoMixer, AudioLoader

class TestMonoMixer_Streaming(TestCase):
    left = []
    right = []

    def clickTrack(self):
        size = 100
        offset = 10
        self.left = [0]*size
        self.right = [0]*size
        for i in range(int(offset/2), size, offset):
            self.left[i] = 1.0
        for i in range(offset, size, offset):
            self.right[i] = 1

        output = []
        for i in range(size):
            output.append((self.left[i], self.right[i]))

        return array(output)

    def testLeft(self):
        gen = VectorInput(self.clickTrack())
        chGen = VectorInput([2])
        mixer = MonoMixer(type='left')
        pool = Pool()

        gen.data >> mixer.audio
        mixer.audio >> (pool, "mix")
        chGen.data >> mixer.numberChannels
        chGen.push('data', 2)
        run(gen)
        self.assertEqualVector(pool['mix'], self.left)

    def testRight(self):
        gen = VectorInput(self.clickTrack())
        chGen = VectorInput([2])
        mixer = MonoMixer(type='right')
        pool = Pool()

        gen.data >> mixer.audio
        mixer.audio >> (pool, "mix")
        chGen.data >> mixer.numberChannels
        chGen.push('data', 2)
        run(gen)
        self.assertEqualVector(pool['mix'], self.right)

    def testMix(self):
        gen = VectorInput(self.clickTrack())
        chGen = VectorInput([2])
        mixer = MonoMixer(type='mix')
        pool = Pool()

        gen.data >> mixer.audio
        mixer.audio >> (pool, "mix")
        chGen.data >> mixer.numberChannels
        chGen.push('data', 2)
        run(gen)
        self.assertEqual(sum(pool['mix']), 19*0.5)

    def testSingle(self):
        gen = VectorInput(array([(0.9, 0.5)]))
        chGen = VectorInput([2])
        mixer = MonoMixer(type='mix')
        pool = Pool()

        gen.data >> mixer.audio
        mixer.audio >> (pool, "mix")
        chGen.data >> mixer.numberChannels
        chGen.push('data', 2)
        run(gen)
        self.assertAlmostEqual(sum(pool['mix']), (0.9+0.5)*0.5)

    def testEmpty(self):
        inputFilename = join(testdata.audio_dir, 'generated', 'empty', 'empty.aiff')
        # NOTE: AudioLoader will through exception on "empty.wav" complaining that 
        # it cannot read stream info, using "empty.aiff" therefore... 
        loader = AudioLoader(filename=inputFilename)
        mixer = MonoMixer(type='left')
        pool = Pool()

        loader.audio >> mixer.audio
        mixer.audio >> (pool, "mix")
        loader.numberChannels >> mixer.numberChannels
        loader.sampleRate >> None
        loader.md5 >> None
        loader.bit_rate >> None
        loader.codec >> None
        run(loader)
        self.assertEqualVector(pool.descriptorNames(), [])

    def testInvalidParam(self):
        self.assertConfigureFails(MonoMixer(), {'type':'unknown'})


suite = allTests(TestMonoMixer_Streaming)

if __name__ == '__main__':
    TextTestRunner(verbosity=2).run(suite)
