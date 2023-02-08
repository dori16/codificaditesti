## Progetto di codifica di testi - Clara Reynolds 603673 e Isidoro Allegretti 559896

Il progetto è stato realizzato  per l'esame di codifica di testi, previsto dal corso di laurea triennale in Informatica Umanistica, nell'anno accademico 2022-2023.
Immagini 16 e 17 (codice archivistico BGE Ms. fr. 3951/07), di Ferdinand de Saussure.

L'xml è stato validato utilizzando Xerces, mentre per la generazione dell'output da xsl ad html è stato usato Saxon.
I comandi per validare e compilare il progetto:

## Validazione XML tramite Xerces

```shell
$ java -cp "_tools/xerces/xml-apis.jar;_tools/xerces/xercesImpl.jar;_tools/xerces/xercesSamples.jar" dom.Counter -v tei_corpus.xml
```

## Generazione output HTML a partire da .xsl tramite Saxon

```shell
$ java -jar _tools/saxon/saxon-he-11.4.jar -s:tei_corpus.xml -xsl:src/progetto.xsl -o:src/index.html
```
