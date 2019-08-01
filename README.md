### Run the container
```
docker run --rm -ti -p 9000:9000 -d tchewik/corenlp
```

### Use it in python script

```
pip install -U pip pycorenlp
```

```python
from pycorenlp import StanfordCoreNLP

container = 'http://hostname:9000'
nlp = StanfordCoreNLP(container)
nlp_properties = {
  'annotators': 'tokenize,ssplit,tokenize,ssplit,pos,depparse,natlog,openie,ner',
  'outputFormat': 'json'
}

result = nlp.annotate(text, properties=nlp_properties)
```
