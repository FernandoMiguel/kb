sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

sudo defaults write com.apple.screensaver askForPassword -int 1
sudo defaults write com.apple.screensaver askForPasswordDelay -int 0

sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

sudo defaults write com.apple.BezelServices kDim -bool true

sudo defaults write NSGlobalDomain KeyRepeat -int 0

sudo defaults write com.apple.BezelServices kDimTime -int 300

sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
sudo defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
sudo defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

sudo defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

sudo chflags nohidden $HOME/Library

sudo defaults write com.apple.finder AppleShowAllFiles -bool true

sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true

sudo defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false


sudo defaults write com.apple.finder ShowPathbar -bool true

sudo defaults write com.apple.finder ShowStatusBar -bool true

sudo defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

sudo defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

sudo defaults write com.apple.finder QuitMenuItem -bool true

sudo defaults write com.apple.finder WarnOnEmptyTrash -bool false

sudo defaults write com.apple.finder QLEnableTextSelection -bool true

sudo defaults write com.apple.Safari UniversalSearchEnabled -bool false

sudo defaults write com.apple.addressbook ABShowDebugMenu -bool true

sudo defaults write com.apple.iCal IncludeDebugMenu -bool true

sudo defaults write com.apple.TextEdit RichText -int 0

sudo defaults write com.apple.TextEdit PlainTextEncoding -int 4
sudo defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

sudo defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
sudo defaults write com.apple.DiskUtility advanced-image-options -bool true

sudo defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

sudo defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

sudo defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

sudo defaults write com.apple.appstore WebKitDeveloperExtras -bool true

sudo defaults write com.apple.appstore ShowDebugMenu -bool true

sudo hash tmutil &> /dev/null && sudo tmutil disablelocal

sudo defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

sudo defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

sudo defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

sudo defaults write com.apple.finder AppleShowAllFiles TRUE

/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

sudo defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

sudo defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

sudo defaults write com.apple.dock launchanim -bool false

sudo defaults write com.apple.ActivityMonitor ShowCategory -int 0

sudo defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
sudo defaults write com.apple.ActivityMonitor SortDirection -int 0

ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
export PATH="/usr/local/bin:$PATH"

brew install bash-completion2
brew install brew-cask
brew install ack
brew install wget
brew install bash
brew install vim
brew install ccat
brew install shellcheck
brew install tree
brew install git
brew install the_silver_searcher
brew install node
brew install npm
brew install python3
brew install bpython
brew install curl
brew install libevent
brew install openssl
brew install nvm
brew install thefuck
brew install findutils
brew install rename
brew install readline
brew install git-extras
brew install coreutils
brew install ant
brew install autoconf
brew install automake
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install pandoc
brew install brew-pip
brew install brew-gem
brew install zsh
brew install fish
brew install ctunnel
brew install dnscryptproxy
brew install privoxy
brew install dnsmasq
brew install sshuttle
brew install zshlovers
brew install zsh-syntax-highlighting
brew install ncrack
brew install wifi-password
brew install xcv
brew install autojump
brew cleanup

brew cask install google-chrome
brew cask install lastpass
brew cask install firefox
brew cask install vlc
brew cask install the-unarchiver
brew cask install iterm2
brew cask install teamviewer
brew cask install google-hangouts
brew cask install flickr-uploadr
brew cask install namechanger
brew cask install caffeine
brew cask install gas-mask
brew cask install transmission
brew cask install virtualbox
brew cask install appcleane
brew cask install 1clipboard
brew cask install cakebrew
brew cask install coteditor
brew cask install abricotine
brew cask install proxpn
brew cask install macpass
brew cask install keka
brew cask install megasync
brew cask install dnscrypt
brew cask install apppolice
brew cask install clipy
brew cask install betterzipql
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlprettypatch
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install suspicious-package
brew cask install webp-quicklook
brew cask install menucalendarclock-ical
brew cask install vmware-fusion
brew cask cleanup

sudo defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
sudo defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"

sudo defaults write org.m0k.transmission AutoImportDirectory -string "${HOME}/Downloads"

sudo defaults write org.m0k.transmission DownloadAsk -bool false

sudo defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

sudo defaults write org.m0k.transmission WarningDonate -bool false

sudo defaults write org.m0k.transmission WarningLegal -bool false

sudo defaults write org.m0k.transmission AutoSize -bool true

sudo defaults write org.m0k.transmission AutoUpdateBeta -bool true
