class Video < ActiveRecord::Base
  resourcify
  
  belongs_to :step, :inverse_of => :video

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

  def self.token_form(title, nexturl)
    yt_session.upload_token(video_options(title), nexturl)
  end

  def self.delete_incomplete_videos
    self.incomplete.map{|r| r.destroy}
  end

  private
  def self.video_options(title)
    opts = { title: title,
            :description => 'nu test video',
            :category => "Education",
            :keywords => ["test"],
            :private => "true" }
  end
end
