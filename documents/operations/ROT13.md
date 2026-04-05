# ROT13

## What it is

ROT13 is a fixed Caesar shift of 13 places on the Latin alphabet.

Because the alphabet has 26 letters, shifting by 13 twice returns the original text.

## How it works

1. Read one character at a time.
2. If the character is a letter, move it forward by 13 positions.
3. Wrap at the end of the alphabet.
4. Preserve letter case.
5. Leave digits, spaces, and punctuation unchanged.

## Precise alphabet rule

For uppercase letters:

```text
output = 'A' + ((input - 'A' + 13) mod 26)
```

For lowercase letters:

```text
output = 'a' + ((input - 'a' + 13) mod 26)
```

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

## Why it is special

Most Caesar shifts use different operations for encode and decode. ROT13 is symmetrical because 13 is exactly half of 26.

## Security note

ROT13 is not encryption in any serious sense. It is only a simple substitution transform.
