class Admin::DailyQuestionsController < AdminController
  before_action :assign_daily_question, only: %i(show edit update destroy)
  before_action :assign_questions_body_id, only: %i(new edit create update)

  def index
    @daily_questions = DailyQuestion.all.includes(:question).order('scheduled_at ASC').decorate
  end

  def show
  end

  def new
    @daily_question = DailyQuestion.new
  end

  def create
    @daily_question = DailyQuestion.new(daily_question_params)
    if @daily_question.save
      redirect_to admin_daily_questions_path,
                  notice: t('controllers.crud.success.update',
                          model: t("activerecord.models.#{DailyQuestion.to_s.underscore}"))
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @daily_question.update(daily_question_params)
      redirect_to admin_daily_question_path(@daily_question.id),
                  notice: t('controllers.crud.success.update',
                            model: t("activerecord.models.#{DailyQuestion.to_s.underscore}"))

    else
      render :edit
    end
  end

  def destroy
    @daily_question.destroy
    redirect_to admin_daily_questions_path,
                notice: t('controllers.crud.success.update',
                          model: t("activerecord.models.#{DailyQuestion.to_s.underscore}"))
  end

  private

  def assign_daily_question
    @daily_question = DailyQuestion.find(params[:id])
  end

  def daily_question_params
    params.require(:daily_question).permit(:question_id, :answer_counter,
                                           :scheduled_at)
  end

  def assign_questions_body_id
    @questions_body_id = Question.limit(100).pluck(:body, :id)
  end
end
