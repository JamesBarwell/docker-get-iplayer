This image can be used to run the get_iplayer script from: https://github.com/get-iplayer/get_iplayer

It is recommended to mount a volume into the container as /data. This will be used by the script to cache the index and store any output as follows:
```
/data/config - used for caching
/data/output - used for storing output
```

## Usage

For full instructions please refer to the get_iplayer documentation: https://github.com/get-iplayer/get_iplayer/wiki

```
# View help
docker run -v $(pwd)/data:/data barwell/get-iplayer -h

# Search for 'news'
docker run -v $(pwd)/data:/data barwell/get-iplayer news

# Download program at index 1234
docker run -v $(pwd)/data:/data barwell/get-iplayer --get 1234
```
