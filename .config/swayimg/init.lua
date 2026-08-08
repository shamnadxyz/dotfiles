swayimg.imagelist.order = 'mtime'

-- set font size
swayimg.text.size = 12
swayimg.text.color = 0xe0e2eaff
swayimg.text.background = 0xff141923

swayimg.overlay = false
swayimg.decoration = false

swayimg.gallery.border_size = 2
swayimg.gallery.border_color = 0xffDBE3F1
swayimg.gallery.aspect = 'keep'
swayimg.gallery.window_color = 0xff141923

swayimg.viewer.set_text('bottomleft', {
  '{name}',
})
swayimg.viewer.set_text('bottomright', {
  '{list.index}/{list.total}',
})
swayimg.viewer.set_text('topleft', {})
swayimg.viewer.set_text('topright', {})

swayimg.gallery.set_text('bottomleft', {
  '{name}',
})
swayimg.gallery.set_text('bottomright', {
  '{list.index}/{list.total}',
})
swayimg.gallery.set_text('topleft', {})
swayimg.gallery.set_text('topright', {})

-- Move image position using [hljk]
swayimg.viewer.on_key('h', function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x + 10, pos.y)
end)

swayimg.viewer.on_key('l', function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x - 10, pos.y)
end)

swayimg.viewer.on_key('j', function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, pos.y - 10)
end)

swayimg.viewer.on_key('k', function()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, pos.y + 10)
end)

-- Zoom in and out
swayimg.viewer.on_key('i', function() swayimg.viewer.scale = swayimg.viewer.scale + swayimg.viewer.scale / 10 end)
swayimg.viewer.on_key('o', function() swayimg.viewer.scale = swayimg.viewer.scale - swayimg.viewer.scale / 10 end)

swayimg.viewer.on_key('r', function() swayimg.viewer.reset() end)

-- Switch images in viewer using [np]
swayimg.viewer.on_key('n', function() swayimg.viewer.open 'next' end)
swayimg.viewer.on_key('p', function() swayimg.viewer.open 'prev' end)

-- Switch images in viewer using C-[jk]
swayimg.viewer.on_key('Ctrl+j', function() swayimg.viewer.open 'next' end)
swayimg.viewer.on_key('Ctrl+k', function() swayimg.viewer.open 'prev' end)

-- Vim navigation in gallery mode
swayimg.gallery.on_key('j', function() swayimg.gallery.select 'down' end)
swayimg.gallery.on_key('k', function() swayimg.gallery.select 'up' end)
swayimg.gallery.on_key('h', function() swayimg.gallery.select 'left' end)
swayimg.gallery.on_key('l', function() swayimg.gallery.select 'right' end)

swayimg.gallery.on_key('g', function() swayimg.gallery.select 'first' end)
swayimg.gallery.on_key('Shift+G', function() swayimg.gallery.select 'last' end)

swayimg.gallery.on_key('q', function() swayimg.exit(0) end)
swayimg.viewer.on_key('q', function() swayimg.exit(0) end)

swayimg.viewer.on_key('Escape', function() swayimg.mode 'gallery' end)
swayimg.viewer.on_key('Ctrl+bracketleft', function() swayimg.mode 'gallery' end)
