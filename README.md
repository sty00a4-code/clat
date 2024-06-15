# CLAT

Command Line Application Tokenizer

## Examples
---
```
echo hello there
```

```lua
{
    [1] = "echo",
    [2] = "hello",
    [3] = "there",
}
```
---
```
echo "hello there"
```

```lua
{
    [1] = "echo",
    [2] = "hello there",
}
```
---
```
echo hello -nl
```

```lua
{
    [1] = "echo",
    [2] = "hello",
    ["nl"] = true,
}
```
---
```
echo hello -wait=1
```

```lua
{
    [1] = "echo",
    [2] = "hello",
    ["wait"] = "1",
}
```
---
```
echo hello there -sep=" "
```

```lua
{
    [1] = "echo",
    [2] = "hello",
    [3] = "there",
    ["sep"] = " ",
}
```
---