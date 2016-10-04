# barnabas

Encouragements from your Terminal.

Feel like you forget to keep in touch with your friends?
Spend a lot of time in your Terminal?

Barnabas gives you a nudge every now and again, to reach out and say hello. And if you’re an iPhone owner or use iMessage with your Apple ID, barnabas can send the messages without interrupting your workflow!

# Installation

## via [Homebrew][brew]

- `brew tap anicholson/andrewdotnich`
- `brew install barnabas`

## From Sources

Barnabas is written in [Crystal][crystal], so make sure you have a Crystal compiler installed before you begin. (The easiest way, if you have [homebrew][brew], is `brew install crystal-lang`)

- `git clone https://github.com/anicholson/barnabas.git`
- `cd barnabas`
- `./build.sh`
- Copy `build/barnabas` to somewhere on your $PATH
- From the source directory, run `crystal src/setup.cr`

To test everything worked, you should be able to run `barnabas`.

# Running

[coming soon]

[crystal]: http://crystal-lang.org/
[brew]: http://brew.sh/