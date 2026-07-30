require 'init'

-- Print Image path
swayimg.gallery.on_key('Shift+Return', function()
  local image = swayimg.gallery.get_image()
  if image == nil then return end
  print(image.path)
  swayimg.exit(0)
end)

swayimg.viewer.on_key('Shift+Return', function()
  local image = swayimg.viewer.get_image()
  if image == nil then return end
  print(image.path)
  swayimg.exit(0)
end)

swayimg.gallery.pstore = true
