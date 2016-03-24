#
# Copyright (C) 2016 Promwad.com
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

THEME_NAME:=anonabox
THEME_TITLE:=Anonabox

PKG_NAME:=luci-theme-$(THEME_NAME)
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-theme-$(THEME_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=9. Themes
  TITLE:=LuCI Theme - $(THEME_TITLE)
  PKGARCH:=all
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-theme-$(THEME_NAME)/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	echo "uci set luci.themes.$(THEME_TITLE)=/luci-static/$(THEME_NAME); uci commit luci" > $(1)/etc/uci-defaults/luci-theme-$(THEME_NAME)
	$(INSTALL_DIR) $(1)/www/luci-static/$(THEME_NAME)
	$(CP) -a ./files/htdocs/* $(1)/www/luci-static/$(THEME_NAME)/ 2>/dev/null || true
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/themes/$(THEME_NAME)
	$(CP) -a ./files/templates/* $(1)/usr/lib/lua/luci/view/themes/$(THEME_NAME)/ 2>/dev/null || true
endef

define Package/luci-theme-$(THEME_NAME)/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-theme-$(THEME_NAME) ) && rm -f /etc/uci-defaults/luci-theme-$(THEME_NAME)
}
endef

$(eval $(call BuildPackage,luci-theme-$(THEME_NAME)))
