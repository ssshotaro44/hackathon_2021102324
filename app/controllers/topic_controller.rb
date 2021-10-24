class TopicController < ApplicationController
  def choose
    @topics = TalkTopic.all
  end

  def chose
    @topic = TalkTopic.find_by(id: params[:id])
  end

  def generate
    user_checked_id_list = []

    # paramsに何も入っていない場合の処理ついき

    TalkTopic.all.each do |talk_topic|
      i_str = talk_topic.id.to_s

      user_checked_id_list.push(i_str) if params[i_str] == 'on'
    end

    user_checked_id_cnt = user_checked_id_list.length
    redirect_to('/topic/choose') if user_checked_id_cnt.zero?

    sec_now_plus_one = Time.now.sec.to_i + 1
    user_checked_id_list_idx = sec_now_plus_one % user_checked_id_cnt

    @topic = TalkTopic.find_by(id: user_checked_id_list[user_checked_id_list_idx])

    redirect_to("/topic/chose/#{@topic.id}")
  end
end
