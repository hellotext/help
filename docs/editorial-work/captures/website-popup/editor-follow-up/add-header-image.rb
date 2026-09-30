load File.join(__dir__, 'preflight.rb')
image = Rails.root.join('app/assets/images/examples/intro-popup-left2.jpg')
raise 'Changed example image' unless Digest::SHA256.file(image).hexdigest == ARGV.fetch(0)
popup = Popup.find(1)
if popup.overlay_background_image.attached?
  raise 'Unexpected existing image' unless popup.overlay_background_image.filename.to_s == 'editorial-fruit-header.jpg' && Digest::SHA256.hexdigest(popup.overlay_background_image.download) == ARGV.fetch(0)
else
  popup.overlay_background_image.attach(io: File.open(image), filename: 'editorial-fruit-header.jpg', content_type: 'image/jpeg')
end
raise 'Header attachment failed' unless popup.reload.overlay_background_image.attached?
load File.join(__dir__, 'preflight.rb')
