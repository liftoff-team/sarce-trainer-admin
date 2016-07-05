class Admin::DocumentationsController < AdminController
  before_action :assign_documentation, only: %i(show edit update destroy)
  before_action :assign_documentations_cover_path, only: %i(new edit create update)

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
                  notice: t('controllers.crud.success.create',
                            model: t("activerecord.models.#{Documentation.to_s.underscore}"))

    else
      render :new
    end
  end

  def edit
  end

  def update
    if @documentation.update(documentation_params)
      redirect_to admin_documentation_path(@documentation.id),
                  notice: t('controllers.crud.success.update',
                            model: t("activerecord.models.#{Documentation.to_s.underscore}"))

    else
      render :edit
    end
  end

  def destroy
    @documentation.destroy
    redirect_to admin_documentations_path,
                notice: t('controllers.crud.success.destroy',
                          model: t("activerecord.models.#{Documentation.to_s.underscore}"))
  end

  private

  def documentation_params
    params.require(:documentation).permit(:name, :short_name, :cover_path)
  end

  def assign_documentation
    @documentation = Documentation.find(params[:id])
  end

  def assign_documentations_cover_path
    @documentations_cover_path = Documentation.pluck(:cover_path)
  end
end
