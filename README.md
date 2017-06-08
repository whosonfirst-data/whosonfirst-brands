# whosonfirst-brands

Brands in Who's On First documents.

## Caveats

This is a work in progress and very much still "wet paint" and there is little to no tooling for this stuff yet.

## Where do all these #brands come from?

At the moment, they come from the Elasticsearch index running the [Who's On First Spelunker](https://whosonfirst.mapzen.com/spelunker). They are the product of a not very sophisticated faceting process on an unanalyzed copy of the `wof:name` field (called unsuprisingly `name_not_analyzed`). Like this:

```
curl -s -v --max-time 600 'http://localhost:9200/spelunker/_search?from=0&size=50' -d '{"query": {"term": {"w:placetype": "venue"}}, "aggregations": {"brands": {"terms": {"field": "name_not_analyzed", "size": 0}}}, "size": 0}' > brands.json
```

That produces something like 16 _million_ distinct names. We have _not_ imported most of those. Instead we have limited the #brands included here to only those with 50 (or more) venues. Maybe it should be 25, maybe it should be 10. Maybe it should be 5. We don't know yet. We're figuring it out as we go...