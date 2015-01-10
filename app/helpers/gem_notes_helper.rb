module GemNotesHelper
  def gem_active_class gemnote
    gemnote.actived? ? "actived" : ""
  end
end
