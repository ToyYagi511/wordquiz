class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]

  def index
    respond_to do |format|
      @questions = Question.all
      format.html do
        @questions
      end
      format.json do
        render json: {data: @questions}
      end
    end
  end

  def new
  end

  def create
    @question = Question.new(question: params[:question], description: params[:description])

    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_path, notice: '単語登録に成功しました。' }
        format.json { render json: @question, status: :created, location: @question  }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:success] = t "保存しました。"
      redirect_to questions_path
    else
       render 'edit'
    end
  end

  def destory
  end

  private
  def question_params
    params.require(:question).permit :question, :description
  end

  def set_question
    @question = Question.find_by_id(params[:id])
  end
end
