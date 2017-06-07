# whosonfirst-brands

Brands in Who's On First documents.

## Caveats

This is a work in progress and very much still "wet paint".

## Extracting #brands

Hopefully this won't be necessary going forward but it is necessary, today.

```
curl -s -v --max-time 600 'http://localhost:9200/spelunker/_search?from=0&size=50' -d '{"query": {"term": {"w:placetype": "venue"}}, "aggregations": {"countries": {"terms": {"field": "name_not_analyzed", "size": 0}}}, "size": 0}' > brands.json
```
