class MusicsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        @musics = Music.all
    end
 
    def new
      @music = Music.new
    end
  
    #追加箇所
    def create
      # データベース内に同じ content 値が存在するか確認
      if Music.exists?(content: music_params[:content])
        @music = Music.new
        @music.errors.add(:content, "アーティスト名はすでに存在します")
        render :new
      else
        @music = Music.new(music_params)
        if @music.save
          # カテゴリーに応じてリダイレクト先を設定
          if @music.category == "idol"
            redirect_to musics_idol_path
          elsif @music.category == "japaneserock"
            redirect_to musics_japaneserock_path
          elsif @music.category == "anime"
            redirect_to musics_anime_path
          elsif @music.category == "kpop"
            redirect_to musics_kpop_path
          elsif @music.category == "jpop"
            redirect_to musics_jpop_path
          else
            # その他のカテゴリーに対するリダイレクト先を設定する場合、ここに追加
            redirect_to musics_westernrock_path
          end
        else
          render :new
        end
      end
    end
    

  def idol
    if params[:search] == nil
      @musics= Music.all
    elsif params[:search] == ''
      @musics= Music.all
    else
      #部分検索
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end 
  
  def westernrock
    if params[:search] == nil
      @musics= Music.all
    elsif params[:search] == ''
      @musics= Music.all
    else
      #部分検索
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end
 
  def japaneserock
    if params[:search] == nil
      @musics= Music.all
    elsif params[:search] == ''
      @musics= Music.all
    else
      #部分検索
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def anime
    if params[:search] == nil
      @musics= Music.all
    elsif params[:search] == ''
      @musics= Music.all
    else
      #部分検索
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def kpop
    if params[:search] == nil
      @musics= Music.all
    elsif params[:search] == ''
      @musics= Music.all
    else
      #部分検索
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def jpop
    if params[:search] == nil
      @musics= Music.all
    elsif params[:search] == ''
      @musics= Music.all
    else
      #部分検索
      @musics = Music.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end


  def destroy
    music = Music.find(params[:id])
    category = music.category 
  
    music.destroy
  
    case category
    when "idol"
      redirect_to musics_idol_path
    when "japaneserock"
      redirect_to musics_japaneserock_path
    when "anime"
      redirect_to musics_anime_path
    when "kpop"
      redirect_to musics_kpop_path
    when "jpop"
      redirect_to musics_jpop_path
    else
      redirect_to musics_westernrock_path
    end
  end
  
  
  
  
  
  


  def artist_songs
      @music = Music.find(params[:id])
      @new_song = Song.new
      @songs = @music.songs
  end

      private
      def music_params
        params.require(:music).permit(:music, :hand, :note, :content, :category, :image)
      end
end
