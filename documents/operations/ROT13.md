# ROT13

## What it does

ROT13 is a fixed Caesar shift of 13 places on the Latin alphabet.

Because the alphabet has 26 letters, shifting by 13 twice returns the original text.

## Core algorithm in the app

1. For each uppercase letter, shift within `A-Z`.
2. For each lowercase letter, shift within `a-z`.
3. Leave all non-letter characters unchanged.

For uppercase letters:

```text
output = 'A' + ((input - 'A' + 13) mod 26)
```

For lowercase letters:

```text
output = 'a' + ((input - 'a' + 13) mod 26)
```

The app shares this behavior through a helper that normalizes the shift modulo 26 and applies it separately to uppercase and lowercase ASCII letters.

## Example

Input:

```text
Hello World
```

Output:

```text
Uryyb Jbeyq
```

Applying ROT13 again returns:

```text
Hello World
```

## Security note

ROT13 is not encryption in any serious sense. It is only a simple substitution transform.
