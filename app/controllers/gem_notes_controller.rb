class GemNotesController < ApplicationController
  before_action :gem_note_params, only: :create
  before_action :set_gem_note, only: :delete

  def index
    @facade = GemNotesFacade.new
  end

  def create
    gem_note = GemNotesFacade.create(gem_note_params)
    if gem_note
      render json: { status: :success, code: 200, id: gem_note_id}
    else
      render json: { status: :error, code: 500 }
    end
  end

  def delete
    @gem_note.destroy
    render json: { status: :success, code: 200 }
  end

  private

  def gem_note_params
    # TODO: add pure params like gemfile
    params.require(:gem_note).permit(:name, :version, :source, :repository, :branch)
  end

  def set_gem_note
    @gem_note = GemNote.find_by(id: params[:id])
    render json: { status: :error, code: 404 } if @gem_note.nil?
  end
end
