class GemNotesFacade
  attr_reader :gem_notes

  def initialize
    @gem_notes = GemNote.all
  end

end
