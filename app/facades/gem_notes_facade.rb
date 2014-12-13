class GemNotesFacade
  attr_reader :gem_notes
  attr_reader :gem_note

  def initialize
    @gem_notes = GemNote.all
    @gem_note = GemNote.new
  end

end
