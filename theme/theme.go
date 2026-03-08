package theme

import "embed"

//go:embed *.css all:vendor
var Assets embed.FS
