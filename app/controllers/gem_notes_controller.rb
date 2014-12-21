class GemNotesController < ApplicationController
  before_action :gem_note_facade, except: [:destroy]
  before_action :set_gem_note, only: :destroy

  def index
    @facade.all
  end

  def create
    if @facade.create(gem_note_params)
      respond_to do |format|
        format.html { redirect_to :gem_notes }
        format.xml { render json: { status: :success, code: 200, id: @facade.gem_note.id} }
      end
    else
      respond_to do |format|
        format.html do
          @facade.all
          render :index
        end
        format.xml { render json: { status: :error, code: 500 } }
      end
    end
  end

  def destroy
    @gem_note.destroy
    respond_to do |format|
      format.html { redirect_to :gem_notes }
      format.xml do
        render json: { status: :success, code: 200, id: gem_note.id}
      end
    end
  end

  private

  def gem_note_params
    params.require(:gem_note).permit(:name,
      :version,
      :require,
      :groups,
      :platforms,
      :source,
      :git,
      :github,
      :path,
      :branch,
      :tag,
      :ref,
      :submodules,
      :description,
      :active)
  end

  def gem_note_facade
    @facade = GemNotesFacade.new
  end

  def set_gem_note
    # @facade.find(id: params[:id])
    @gem_note = GemNote.find_by(id: params[:id])
    render json: { status: :error, code: 404 } if @gem_note.nil?
  end
end
