class GemNotesFacade
  attr_reader :gem_notes
  attr_reader :gem_note

  def initialize
    @gem_note = GemNote.new
  end

  def create params
    @gem_note = GemNote.new params
    @gem_note.save
  end

  def all
    @gem_notes = GemNote.all
  end
end
