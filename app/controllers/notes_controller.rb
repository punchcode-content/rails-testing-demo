class NotesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { render json: {"success": true}}
    end
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
