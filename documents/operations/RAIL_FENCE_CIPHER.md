# Rail Fence Cipher

## What it does

Rail Fence Cipher is a transposition cipher that writes characters in a zigzag pattern across a chosen number of rails, then reads off each rail in order.

## Encoding algorithm in the app

1. Choose a rail count.
2. Start on rail `0` moving downward.
3. Write one character on the current rail.
4. Move one rail in the current direction.
5. Reverse direction at the top rail and bottom rail.
6. After all characters are assigned, concatenate the rail strings.

For 3 rails, the pattern of rail indices is:

```text
0 1 2 1 0 1 2 1 ...
```

## Decoding algorithm in the app

The app reconstructs the zigzag pattern:

1. Build the rail index pattern for the full message length.
2. Count how many characters belong to each rail.
3. Slice the ciphertext into that many characters per rail.
4. Replay the original rail pattern and pull the next character from the matching rail slice.

That makes decoding exact and reversible.

## Edge behavior

If `rails < 2`, the app rejects the parameters.

If the input is extremely short or the rail count is at least the input length, the app returns the input unchanged.
