class SiteMailer < ApplicationMailer

  # 予定作業の作成、更新時メール
  def send_update_work_mail(site, site_user)
    @site = site

    @mail = SiteMailer.new()
    mail(
      from: ENV['MAIL_ADDRESS'],
      to:   site_user.email,
      subject: '予定確認願い'
    )
  end

  # 予定作業の作成、更新時メール送信
  def self.send_update_work_to_site_user(site)
    site.users.each do |site_user|
      SiteMailer.send_update_work_mail(site, site_user).deliver_now
    end
  end


  def send_cansel_work_mail(site, work, site_user)
    @site = site
    @work = work

    @mail = SiteMailer.new()
    mail(
      from: ENV['MAIL_ADDRESS'],
      to:   site_user.email,
      subject: '作業中止連絡'
    )
  end

  def self.send_cansel_work_to_site_user(site, work)
    site.users.each do |site_user|
      SiteMailer.send_cansel_work_mail(site, work, site_user).deliver_now
    end
  end

end
