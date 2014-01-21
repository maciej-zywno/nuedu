class Video < ActiveRecord::Base
  resourcify
  
  belongs_to :step, :inverse_of => :video

  validates :title, presence: true


  scope :complete,   where(complete: true)
  scope :incomplete, where(complete: false)

  scope :recent, ->(num) { order('created_at DESC').limit(num) }

  def self.yt_session
    @yt_session ||= YouTubeIt::Client.new(:username => YouTubeITConfig.username , :password => YouTubeITConfig.password , :dev_key => YouTubeITConfig.dev_key)
  end

  def self.delete_video(video)
    yt_session.video_delete(video.yt_video_id)
    video.destroy
  rescue
    video.destroy
  end

  def self.update_video(video, params)
    yt_session.video_update(video.yt_video_id, video_options(params))
    video.update_attributes(params)
  end

  def self.token_form(params, nexturl)
    yt_session.upload_token(video_options(params), nexturl)
  end

  def self.delete_incomplete_videos
    self.incomplete.map{|r| r.destroy}
  end

  private
  def self.video_options(params)
    opts = {:title => params[:title],
            :description => 'nu test video',
            :category => "Education",
            :keywords => ["test"]}
    params[:is_unpublished] == "1" ? opts.merge(:private => "true") : opts
  end
end
