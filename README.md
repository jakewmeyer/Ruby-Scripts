<div align="center">

![Imgur](http://i.imgur.com/3DhlBWZ.png)

# Ruby Scripts

### A collection of ruby scripts for those who live in the command line.

[![GitHub release](https://img.shields.io/github/release/jakewmeyer/Ruby-Scripts.svg)]()
[![GitHub release](https://img.shields.io/badge/language-Ruby-red.svg)]() [![license](https://img.shields.io/github/license/mashape/apistatus.svg)]()
[![License](https://img.shields.io/badge/platform-MacOS%20%2B%20Linux-blue.svg)]()

### Stock Search / File Encryptor / Currency Converter / Weather Search / Movie Search / IP Geolocation / IP List



</div>
<br></br>

## Install / Setup
Installs necessary gems and downloads the files as master.zip
```bash
curl -sSL https://git.io/vHp98 | sh
```
```bash
ruby stocks.rb
```

I've also included a folder "bin" with the same programs configured as scripts, with the .rb removed, and execute privileges given. By adding these programs to a bin folder in your PATH, you can run the commands like shown in the screenshots.
## Gems Used
* [Rest-Client](https://github.com/rest-client/rest-client) - Client for making HTTP requests in ruby
* [Ruby Money](https://github.com/RubyMoney/money) - Ruby library for accurate currency management
* [Monetize](https://github.com/RubyMoney/monetize) - Ruby library for money object creation

## Stock Search - Returns current stock information
![Imgur](http://i.imgur.com/LpIFAdf.png)

## Currency Exchange - Returns converted currency based on realtime exchange rates
Uses [Fixer.io](http://fixer.io/) for exchange data.

![Imgur](http://i.imgur.com/KSP7wOo.png)

## File Encryptor - Uses OpenSSL to encrypt and decrypt files with a password
```bash
encrypt [original file] [encrypted file]
decrypt [encrypted file] [output file]
```
CAUTION: Make sure you don't name your decrypt output the same as the original file name. Otherwise it will be overwritten!

![Imgur](http://i.imgur.com/0bJi1Ds.png)

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
