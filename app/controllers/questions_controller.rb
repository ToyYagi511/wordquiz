class QuestionsController < ApplicationController

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

  end

  def destory

  end
end
