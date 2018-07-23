<div align="center">

![Imgur](https://i.imgur.com/PZjUHDE.png)

# Ruby Scripts

### A collection of ruby scripts for those who live in the command line.

[![GitHub release](https://img.shields.io/github/release/jakewmeyer/Ruby-Scripts.svg)]()
[![Gem](https://img.shields.io/gem/dt/jake-scripts.svg)]()
[![Language](https://img.shields.io/badge/language-Ruby-red.svg)]()
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)]()

### Stock Finder / Currency Converter / Weather / Movie Search

</div>
<br></br>

## Install / Setup
Install all the scripts easily as a [ruby gem](https://rubygems.org/gems/jake-scripts)
```ruby
gem install jake-scripts
```

## Stock Search - Returns current stock information
![Imgur](https://i.imgur.com/H6pwzmJ.png)

## Cryptocurrency Search - Returns current cryptocurrency price information
Uses the [CryptoCompare](https://min-api.cryptocompare.com/) API for current price information

![Imgur](https://i.imgur.com/GLNlCOy.png)

## Weather Search - Returns current weather information based on IP
Uses the [APIXU](https://www.apixu.com/) weather api for data based on IP.

Can also have a city passed as an argument to override the IP location.
```bash
weather dallas
```

![Imgur](https://i.imgur.com/dv7yxLu.png)

## Movie Search - Uses OMDB API to return movie data
Uses the [OMDB](http://www.omdbapi.com/) API.

![Imgur](https://i.imgur.com/IYFJBMH.png)

## Currency Exchange - Returns converted currency based on realtime exchange rates
Uses [Fixer.io](http://fixer.io/) for exchange data.

Uses [Ruby Money](https://github.com/RubyMoney/money) for conversion accuracy + currency symbols

![Imgur](https://i.imgur.com/f0iwDBP.png)`

## API Keys
Users now have the option to set their own API keys through environment variables thanks to [sethkrasnianski](https://github.com/sethkrasnianski)
```bash
export OMDBAPI_API_KEY=key
export APIXU_API_KEY=key
```

## Gems Used
* [Ruby Money](https://github.com/RubyMoney/money) - Ruby gem for accurate currency management
* [Monetize](https://github.com/RubyMoney/monetize) - Ruby gem for money object creation
* [Colorize](https://github.com/fazibear/colorize) - Ruby gem for text and background CLI colors

## FAQ / Contact
* If you run into any issues, please open an issue ASAP and we'll work to get it resolved and merged.
* All Programs are fully functional, with live API keys baked in.
* Terminal used is [Hyper.js](https://hyper.is/) -> Background Color: #292937
* Using [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh), Robby Russell theme, [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), and [zsh_autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
