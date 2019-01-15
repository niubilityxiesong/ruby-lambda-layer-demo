# Steps
## 1, create Gemfile
## 2, install dependencies
```bash
bundle install --path=.  
```
## 3, create layer
```bash
./scripts/publish.sh
```
It will create a layer called test_ruby_layer in aws and a random.zip in your local project

## 4, add layer in lambda function
```bash
aws lambda update-function-configuration --function-name <function-name> --layers <LayerVersionArn>
```
You must specify the version of each layer to use by providing the full ARN of the layer version. When you add layers to a function that already has layers, the previous list is overwritten by the new one.

## 5, add Environment variables
open your Lambda function and add a environment variables
key: GEM_PATH
value: /opt/ruby/2.5.0

# Others
## delete layer in lambda function
When you add layers to a function that already has layers, the previous list is overwritten by the new one. Include all layers every time you update the layer configuration. To remove all layers, specify an empty list.
```bash
aws lambda update-function-configuration --function-name <function-name> --layers []
```

## delete layer
```bash
aws lambda delete-layer-version --layer-name <layer-name> --version-number 4
```

## Matters needing attention
* the name of the zip file can be customized, but the name of the unzipped file must be **ruby**
* A function can use up to 5 layers at a time.
* function + all layers <= 250 MB (unzipped)