-- set order by file size for the image list
swayimg.imagelist.set_order("mtime")

-- set font size
swayimg.text.set_size(12)
-- set font color to fully opaque red color
swayimg.text.set_foreground(0xe0e2eaff)

swayimg.viewer.set_text("bottomleft", {
  "{name}",
})
swayimg.viewer.set_text("bottomright", {
  "{list.index}/{list.total}",
})
swayimg.viewer.set_text("topleft", {})
swayimg.viewer.set_text("topright", {})

swayimg.gallery.set_text("bottomleft", {
  "{name}",
})
swayimg.gallery.set_text("bottomright", {
  "{list.index}/{list.total}",
})
swayimg.gallery.set_text("topleft", {})
swayimg.gallery.set_text("topright", {})

-- Move image position using [hljk]
swayimg.viewer.on_key("h", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y)
end)

swayimg.viewer.on_key("l", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y)
end)

swayimg.viewer.on_key("j", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y - wnd.width / 10))
end)

swayimg.viewer.on_key("k", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y + wnd.width / 10))
end)

-- Zoom in and out
swayimg.viewer.on_key("i", function()
  local scale = swayimg.viewer.get_scale()
  scale = scale + scale / 10
  swayimg.viewer.set_abs_scale(scale)
end)
swayimg.viewer.on_key("o", function()
  local scale = swayimg.viewer.get_scale()
  scale = scale - scale / 10
  swayimg.viewer.set_abs_scale(scale)
end)

swayimg.viewer.on_key("r", function()
  swayimg.viewer.reset()
end)

-- Switch images in viewer using [np]
swayimg.viewer.on_key("n", function()
  swayimg.viewer.switch_image("next")
end)
swayimg.viewer.on_key("p", function()
  swayimg.viewer.switch_image("prev")
end)

-- Switch images in viewer using C-[jk]
swayimg.viewer.on_key("Ctrl+j", function()
  swayimg.viewer.switch_image("next")
end)
swayimg.viewer.on_key("Ctrl+k", function()
  swayimg.viewer.switch_image("prev")
end)

-- Vim navigation in gallery mode
swayimg.gallery.on_key("j", function()
  swayimg.gallery.switch_image("down")
end)
swayimg.gallery.on_key("k", function()
  swayimg.gallery.switch_image("up")
end)
swayimg.gallery.on_key("h", function()
  swayimg.gallery.switch_image("left")
end)
swayimg.gallery.on_key("l", function()
  swayimg.gallery.switch_image("right")
end)

swayimg.gallery.on_key("q", function()
  swayimg.exit(0)
end)

swayimg.viewer.on_key("q", function()
  swayimg.exit(0)
end)

swayimg.viewer.on_key("Escape", function()
  swayimg.set_mode("gallery")
end)
