class Admin::DocumentationsController < AdminController
  before_action :assign_documentation, only: %i(show edit update destroy)

  def index
    @documentations = Documentation.all
  end

  def show
  end

  def new
    @documentation = Documentation.new
  end

  def create
    @documentation = Documentation.new(documentation_params)
    if @documentation.save
      redirect_to admin_documentation_path(@documentation.id),
                  notice: 'The documentation was created successfully!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @documentation.update(documentation_params)
      redirect_to admin_documentation_path(@documentation.id),
                  notice: 'The documentation was updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @documentation.destroy
    redirect_to admin_documentations_path,
                notice: 'The documentation was deleted successfully!'
  end

  private

  def documentation_params
    params.require(:documentation).permit(:name, :short_name, :cover_path)
  end

  def assign_documentation
    @documentation = Documentation.find(params[:id])
  end
end
