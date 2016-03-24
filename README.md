Anonabox theme For LUCI
=================

Anonabox theme is a clean HTML5 theme for LuCI - the web configuration interface commonly found on OpenWrt installation. It is based on luci-theme-bootstrap.

#### To install you have to do the following steps:

1. you need to add this feed to your openwrt feeds list dy adding following line in **openwrt_source_tree/feeds.conf.default file: _src-git anonaboxTheme https://github.com/scherbenokk/luci-anonabox-theme.git_**

2. Update/download all feeds: **_./scripts/feeds update_**

3. Install all (-a) packages from this feed (-p) tor: **_./scripts/feeds install -a -p anonaboxTheme_**

4. Then select needed packages in **menuconfig** and **make** the firmware.

