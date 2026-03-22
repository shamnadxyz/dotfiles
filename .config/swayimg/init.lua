-- set order by file size for the image list
swayimg.imagelist.set_order("mtime")

-- set font size
swayimg.text.set_size(16)
-- set font color to fully opaque red color
swayimg.text.set_foreground(0xe0e2eaff)

-- set top left text block scheme for viewer mode
swayimg.viewer.set_text("topleft", {
  "File: {name}",
  "Format: {format}",
  "File size: {sizehr}",
  "File time: {time}",
  "EXIF date: {meta.Exif.Photo.DateTimeOriginal}",
  "EXIF camera: {meta.Exif.Image.Model}",
})

-- bind the left arrow key to move the image to the left by 1/10 of the application window size
swayimg.viewer.on_key("Left", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y)
end)

-- bind mouse vertical scroll button with pressed Ctrl to zoom in the image at mouse pointer coordinates
swayimg.viewer.on_mouse("Ctrl-ScrollUp", function()
  local pos = swayimg.get_mouse_pos()
  local scale = swayimg.viewer.get_scale()
  scale = scale + scale / 10
  swayimg.viewer.set_abs_scale(scale, pos.x, pos.y)
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

-- print paths to all marked files by pressing Ctrl-p in gallery mode
swayimg.gallery.on_key("Ctrl-p", function()
  local entries = swayimg.imagelist.get()
  for _, entry in ipairs(entries) do
    if entry.mark then
      print(entry.path)
    end
  end
end)
