# docker-elasticsearch2
docker image for elasticsearch 2.x

Run this image with:

```
docker run -d --name es2 bitmuncher/elasticsearch2
```

If you need to add additional parameters, you can use environment variable EXTRA_OPTS

```
docker run -d --name es2 -e EXTRA_OPTS='-Des.script.inline=true' bitmuncher/elasticsearch2
```

Or you can add it to the entrypoint directly:

```
docker run -d --name es2 bitmuncher/elasticsearch2 -Des.script.inline=true
```

If you need persistent data, mount /data/elasticsearch/data as a volume:

```
docker run -d --name es2 -v /path/on/your/host:/data/elasticsearch/data bitmuncher/elasticsearch2
```

You can do the same with the logging directory:

```
docker run -d --name es2 -v /path/on/your/host:/data/elasticsearch/logs bitmuncher/elasticsearch2
```
