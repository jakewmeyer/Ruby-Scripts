<div align="center">

![Imgur](http://i.imgur.com/3DhlBWZ.png)

# Ruby Scripts

### A collection of ruby scripts for those living in the command line.

[![GitHub release](https://img.shields.io/github/release/jakewmeyer/Ruby-Scripts.svg)]()
[![GitHub release](https://img.shields.io/badge/language-Ruby-red.svg)]() [![license](https://img.shields.io/github/license/mashape/apistatus.svg)]() [![Travis](https://img.shields.io/travis/rust-lang/rust.svg)]()
[![License](https://img.shields.io/badge/platform-MacOS%20%2B%20Linux-blue.svg)]()

</div>

## Install / Setup
Installs necessary gems and downloads the files as master.zip
```bash
curl -sSL https://git.io/vHp98 | sh
```
```bash
ruby stocks.rb
```
## Gems Used
* [Rest-Client](https://github.com/rest-client/rest-client) - Client for making HTTP requests in ruby
* [Ruby Money](https://github.com/RubyMoney/money) - Ruby library for accurate currency management
* [Monetize](https://github.com/RubyMoney/monetize) - Ruby library for money object creation

## Stock Search - Returns current stock information
![Imgur](http://i.imgur.com/LpIFAdf.png)

## Currency Exchange - Returns converted currency based on realtime exchange rates
Uses [Fixer.io](http://fixer.io/) for exchange data.

![Imgur](http://i.imgur.com/KSP7wOo.png)

## Weather Search - Returns current weather information based on IP
Uses the [APIXU](https://www.apixu.com/) weather api.

![Imgur](http://i.imgur.com/xzfwJF9.png)

## IP List - Returns network information
![Imgur](http://i.imgur.com/pcyIjKN.png)

## IP Location - Returns info about current WAN IP
![Imgur](http://i.imgur.com/Wtbrt8R.png)

## IP Geolocation - Returns geo info on a specified IP address
![Imgur](http://i.imgur.com/jgeOAFi.png)

## Movie Search - Uses OMDB API to return movie data
Uses the [OMBDB](http://www.omdbapi.com/) API.

![Imgur](http://i.imgur.com/Gj4AjmZ.png)

## FAQ / Contact
* If you run into any issues, please open an issue ASAP and we'll work to get it resolved and merged.
* All Programs are fully functional, with live API keys baked in.
* NOTE: ip_list will only work on a Mac, due to OS specific commands used in the program.
* Terminal used is [Hyper.js](https://hyper.is/) -> Background Color: #292937
* Using [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh), Robby Russell theme, [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), and [zsh_autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
