```
diskutil erasevolume HFS+ 'RAMDisk' `hdiutil attach -nomount ram://262144` &&  open -a "Google Chrome Canary" --args --no-first-run -disk-cache-dir=$(mktemp -d /Volumes/RAMDisk/chromecanary.XXXXXX) --user-data-dir=$(mktemp -d /Volumes/RAMDisk/chromecanary.XXXXXX)
```

and that gives you a brand new RAM based Chrome profile for testing
