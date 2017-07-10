# ChronoPill

A Resin application for a DIY [Apple Time Capsule](https://www.apple.com/lae/airport-time-capsule/).

As a lazy developer, I wanted a wireless Time Machine backup solution without breaking the bank for
an overpriced NAS drive. This
app assume a Raspberry Pi 3 with a USB disk drive.

## Setup

1. Signup at [Resin.io](https://resin.io/), create an app, and follow the
   the instructions to install to a Raspberry Pi 3
1. Either give your Pi a static IP or configure a static IP for it via your DNS
1. Format a USB drive (preferably external hard disk) to “Mac OS Extended”, also known as HFS+.
1. Ensure that
1. Fork (and star!) this repository, and push it up to your resin app repository.
1. In Finder hit `⌘ K`, enter `afp://your.pi.ip.address`
1. Enter username and password (defaults 'tmuser', 'password')
1. Open System Preferences > Time Machine > Select Disk > Time Machine
1. All done


## Configuration

Settings via environment variables:

- `USERNAME`: username for the time machine user.
- `PASSWORD`: password for the time machine user.

## Travis CI

Because I'm extra lazy, I let Travis deploy my code instead of pushing manually. Go ahead and enable [Travis](https://travis-ci.org) on your project.

Create and copy a deploy SSH key:

```
ssh-keygen # Will prompt for a file name, input one like 'id_rsa'
echo -n "\""; cat id_rsa | awk 1 ORS='\\n'; echo "\""
# Don't forget to copy the quotation marks!
```

Add the following variables to your travis build (keep them secret):

- `RESIN_DEPLOY_KEY` - the SSH key you copied above
- `RESIN_REMOTE` - the git repository to deploy your resin app

## My Hardware

I mean, you don't really need the exact hardware I used, but I have:

- [A Raspberry Pi 3](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/)
- [A 1 TB Transcend External HDD](https://www.amazon.com/Transcend-StoreJet-Military-External-TS1TSJ25M3/dp/B005MNGQ6C)

**Remember to star / upvote**
