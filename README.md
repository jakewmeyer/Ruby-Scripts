<div align="center">

![Imgur](http://i.imgur.com/3DhlBWZ.png)

# Ruby Scripts

### A collection of ruby scripts for those who live in the command line.

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/501aa5aee5854d34831a685fae05314d)](https://www.codacy.com/app/jakewmeyer/Ruby-Scripts?utm_source=github.com&utm_medium=referral&utm_content=jakewmeyer/Ruby-Scripts&utm_campaign=badger)
[![GitHub release](https://img.shields.io/github/release/jakewmeyer/Ruby-Scripts.svg)]()
[![Gem](https://img.shields.io/gem/dt/jake-scripts.svg)]()
[![Language](https://img.shields.io/badge/language-Ruby-red.svg)]()
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)]()
[![Platform](https://img.shields.io/badge/platform-MacOS%20%2B%20Linux-blue.svg)]()

### Stock Search / File Encryptor / Currency Converter / Weather Search / Movie Search / IP Geolocation / IP List



</div>
<br></br>

## Install / Setup
Install the scripts easily as a [ruby gem](https://rubygems.org/gems/jake-scripts)
```ruby
gem install jake-scripts
```
## API Keys
* Users now the options to set their own API keys through environment variables
```bash
export OMDBAPI_API_KEY=key_goes_here
export APIXU_API_KEY=key_goes_here
```
## Gems Used
* [Rest-Client](https://github.com/rest-client/rest-client) - Client for making HTTP requests in ruby
* [Ruby Money](https://github.com/RubyMoney/money) - Ruby library for accurate currency management
* [Monetize](https://github.com/RubyMoney/monetize) - Ruby library for money object creation

## Stock Search - Returns current stock information
![Imgur](http://i.imgur.com/LpIFAdf.png)

## Currency Exchange - Returns converted currency based on realtime exchange rates
Uses [Fixer.io](http://fixer.io/) for exchange data.

Uses [Ruby Money](https://github.com/RubyMoney/money) for conversion accuracy + currency symbols

![Imgur](http://i.imgur.com/KSP7wOo.png)

## File Encryptor - Uses OpenSSL to encrypt and decrypt files with a password
```bash
encrypt [original file] [encrypted file]
decrypt [encrypted file] [output file]
```
#### Encryption Details
* Uses AES 256 level encryption
* Key is salted before creation
* Password is never in plain text, and OpenSSL generates key based on password
* Data is encrypted in Base64, so it can be used as plain text in an email. (Not usually necessary if attached as a file)

**Tested With** => .pdf, .txt, .docx, .doc, .png, .jpeg

**CAUTION** => Make sure to use different filenames, otherwise your file will be overwritten!

![Imgur](http://i.imgur.com/C3lnqBl.png)

## Weather Search - Returns current weather information based on IP
Uses the [APIXU](https://www.apixu.com/) weather api.

![Imgur](http://i.imgur.com/xzfwJF9.png)

## IP List - Returns network information
* Now has multiple LAN support
* Now called **ip_list** to avoid conflict on Linux
* Added DNS and Router IP support for Linux

![Imgur](http://i.imgur.com/v0PApJi.png)

## IP Location - Returns info about current WAN IP
![Imgur](http://i.imgur.com/Wtbrt8R.png)

## IP Geolocation - Returns geo info on a specified IP address
![Imgur](http://i.imgur.com/jgeOAFi.png)

**New Features**
* Now the **IP** prompt can be skipped with an argument, and passing a **-m** flag and an argument like **isp** returns machine readable output for easy piping into other shell scripts. Other arguments include [ ip, city, region, country, zip, isp ]
```bash
ip_geo 8.8.8.8
```
```bash
ip_geo -m isp
```
```bash
ip_geo -m isp 8.8.8.8
```

## Movie Search - Uses OMDB API to return movie data
Uses the [OMBDB](http://www.omdbapi.com/) API.

![Imgur](http://i.imgur.com/Gj4AjmZ.png)

## FAQ / Contact
* If you run into any issues, please open an issue ASAP and we'll work to get it resolved and merged.
* All Programs are fully functional, with live API keys baked in.
* NOTE: ip_list will only work on a Mac, due to OS specific commands used in the program.
* Terminal used is [Hyper.js](https://hyper.is/) -> Background Color: #292937
* Using [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh), Robby Russell theme, [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), and [zsh_autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
