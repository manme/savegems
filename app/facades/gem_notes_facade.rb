class GemNotesFacade
  attr_reader :gem_notes
  attr_reader :gem_note

  def initialize user
    @user = user
    pp @user
    @gem_note = user.gem_notes.build
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
