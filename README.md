<div align="center">

![Imgur](http://i.imgur.com/3DhlBWZ.png)

# Ruby Scripts

### A collection of ruby scripts for those who live in the command line.

[![GitHub release](https://img.shields.io/github/release/jakewmeyer/Ruby-Scripts.svg)]()
[![Gem](https://img.shields.io/gem/dt/jake-scripts.svg)]()
[![Language](https://img.shields.io/badge/language-Ruby-red.svg)]()
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)]()
[![Platform](https://img.shields.io/badge/platform-MacOS%20%2B%20Linux-blue.svg)]()

### Network Utils / Stock Search / File Encryptor / Currency Converter / Weather Search / Movie Search

</div>
<br></br>

## Install / Setup
Install the scripts easily as a [ruby gem](https://rubygems.org/gems/jake-scripts)
```ruby
gem install jake-scripts
```
## API Keys
Users now have the option to set their own API keys through environment variables thanks to [sethkrasnianski](https://github.com/sethkrasnianski)
```bash
export OMDBAPI_API_KEY=key
export APIXU_API_KEY=key
```
## Gems Used
* [Rest-Client](https://github.com/rest-client/rest-client) - Client for making HTTP requests in ruby
* [Ruby Money](https://github.com/RubyMoney/money) - Ruby gem for accurate currency management
* [Monetize](https://github.com/RubyMoney/monetize) - Ruby gem for money object creation
* [Slop](https://github.com/leejarvis/slop) - Ruby CLI option parsing framework
* [OS](https://github.com/rdp/os) - Ruby gem for easy operating system identification

## Netgeo - IP network utility
CLI utility for returning LAN, WAN, Router, and DNS IP's, as well as Geodata on current or specific IP's. Outputs clean results to make all your piping dreams come true. | :+1: |

**NOTE:** If no IP is specified, your current public IP is used
```bash
=> netgeo -s ip,city,region 12.34.56.78

=> 12.34.56.78
   Huntington
   WV
```

![Imgur](http://i.imgur.com/6welzqe.png)

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

## Movie Search - Uses OMDB API to return movie data
Uses the [OMBDB](http://www.omdbapi.com/) API.

![Imgur](http://i.imgur.com/Gj4AjmZ.png)

## IP Tools - Old Versions
* **NOTE:** The three scripts below have been replaced by the ```netgeo``` script, which
combines the functionality of all three into a single, easier to use script. These have nice formatting,
but have singular functionality. I'll continue to keep them in the repo for those who like the formatted output,
but I recommend using the new version, instead of the deprecated ones.

![Imgur](http://i.imgur.com/B17b58W.png)

![Imgur](http://i.imgur.com/UpJn4LJ.png)

![Imgur](http://i.imgur.com/uCl7nXu.png)

## FAQ / Contact
* If you run into any issues, please open an issue ASAP and we'll work to get it resolved and merged.
* All Programs are fully functional, with live API keys baked in.
* NOTE: ip_list will only work on a Mac, due to OS specific commands used in the program.
* Terminal used is [Hyper.js](https://hyper.is/) -> Background Color: #292937
* Using [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh), Robby Russell theme, [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), and [zsh_autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
