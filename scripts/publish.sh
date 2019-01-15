#!/bin/bash

zip -r random.zip ./ruby/

aws lambda publish-layer-version --layer-name test_ruby_layer --description "test ruby layer" --license-info "" --zip-file fileb://random.zip --compatible-runtimes ruby2.5