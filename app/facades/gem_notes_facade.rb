class GemNotesFacade
  attr_reader :gem_notes, :gem_note, :tags

  def initialize user
    @user = user
    @gem_note = user.gem_notes.build
    @tags = user.owned_tags
  end

  def create params
    @gem_note = @user.gem_notes.build params
    @gem_note.save
  end

  def update params
    @gem_note = @user.gem_notes.find(params[:id])
    @gem_note.update(params)
  end

  def show hid
    @gem_note = GemNote.find_by hashid: hid
  end

  def all
    @gem_notes = @user.gem_notes.all
  end
end
