class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to 'list_path(list.id)'
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end
  
  
  private
  # private ➡ これより下はこのコントローラ内でしか呼び出せないという宣言
  
  def list_params
    params.require(:list).permit(:title, :body)
    
    # prames ➡ formから送信されたデータをここに格納
    # require ➡  モデルを指定し、その中から送信されたデータを絞り込む
    # permit ➡ requireで絞り込んだデータの中から、保存する(許可する)カラムを指定する
    
    
    
  end
  
end
