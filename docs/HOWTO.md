# Howto: Documentation

### Running localhost docs server

```
cd docs
sphinx-autobuild . _build/html --host 0.0.0.0 --port 10000
```
Now visit http://127.0.0.1:10000



### Updating translations after editing RST files 

Note: All the ``make`` commands below need to be ran in the virtualenv as well!

```
cd docs
../tools/regenerate-translation-mo-files.sh
make gettext && sphinx-intl update --line-width=-1 -p _build/locale -l nl
```

Check the generated or updated PO-files and translate them.


### Checking translation status
```
sphinx-intl stat -d dsmrreader/locales/ -d docs/_locale/ | grep -v "0 fuzzy, 0 untranslated" | grep -v changelog.po
```


### Checking (Dutch) translations results by building locally
```
cd docs
make -e SPHINXOPTS="-D language='nl'" html
```

View generated HTML in: docs/_build/html
