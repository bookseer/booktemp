---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# Типографские соглашения

## Программный код

Пример кода внутри строки, обозначается так: `echo "Hello, World!"`.

Команда вводимая в терминал Unix подобных систем:
```console
$ echo "Hello, World!"
```
Символ **$** является приглашением командной строки. Его вводить не нужно.

<!--
Команда вводимая в командной строке Windows:
```console
c:\> echo "Hello, World!"
```
Символы **c:\\>** являются приглашением командной строки. Их вводить не нужно.
-->

Команда вводимая в терминал Unix подобных систем вместе с выводом:
```{code-cell} python
%%bash
echo "Hello, World!"
```

Python код выглядит
```python
message = "Hello, World!"
print(message)
```

А так — python код и результат его исполнения
```{code-cell} python
message = "Hello, World!"
print(message)
```

+++

## Графические выделения

<!--
:::{admonition} This is a title
:class: note
:class: warning
:class: tip
:class: caution
:class: attention
:class: danger
:class: error
:class: hint
:class: important
:class: seealso
An example of an admonition with a title.
:::
-->

:::{note}
Так обозначаются замечания общего характера.
:::

:::{tip}
Так обозначаются советы и рекомендации.
:::

:::{hint}
Так обозначаются подсказки.
:::

:::{seealso}
Так обозначаются ссылки на материал по теме.
:::

:::{attention}
Материал, требующий особого внимания обозначается так.
:::

:::{warning}
Так обозначаются предупреждения и предостережения.
:::

:::{error}
Так обозначаются действия, которые могут привести к ошибке.
:::

:::{danger}
Потенциально опасные действия, обозначаются так.
:::

+++
